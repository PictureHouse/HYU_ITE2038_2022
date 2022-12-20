#include <bits/stdc++.h>
using namespace std;

class name_age {
	public:
		string name;
		string age;
		
		void set_name_age(string tuple)
		{
			stringstream tuplestr(tuple);
			string agestr;

			getline(tuplestr, name, ',');
			getline(tuplestr, age);
		}
};

class name_salary {
	public:
		string name;
		string salary;
		
		void set_name_salary(string tuple)
		{
			stringstream tuplestr(tuple);
			string salarystr;

			getline(tuplestr, name, ',');
			getline(tuplestr, salary);
		}
};

string make_tuple(string name, string age, string salary)
{
	return name+ ',' + age + ',' + salary + '\n';
}

int main(){

	string buffer[2];
	name_age temp0;
	name_salary temp1;
	fstream block[12];
	ofstream output;

	output.open("./output2.csv");

	if(output.fail())
	{
		cout << "output file opening fail.\n";
	}


	/******************************************************************/
	

	int count0 = 0;
	int count1 = 0;

	while (count0 < 1000) {
		//close existing opened file, then open new .csv file from name_age.
		block[0].close();
		block[0].open("./name_age/" + to_string(count0) + ".csv", ios::in);
		//if failed to open, print error message.
		if (block[0].fail()) {
			cout << "input file opening fail.\n";
		} 
		else {
			count0++;
		}
		
		//do nested-loop join.
		for (int i = 0; i < 10; i++) {
			//get tuple from name_age block.
			getline(block[0], buffer[0]);
			temp0.set_name_age(buffer[0]);
			count1 = 0;
			while (count1 < 1000) {
				//close existing opened file, then open new .csv file from name_salary.
				block[1].close();
				block[1].open("./name_salary/" + to_string(count1) + ".csv", ios::in);
				//if failed to open, print error message.
				if (block[1].fail()) {
					cout << "input file opening fail.\n";
				} 
				else {
					count1++;
				}
				while (!block[1].eof()) {
					//get tuple from name_salary block.
					getline(block[1], buffer[1]);
					temp1.set_name_salary(buffer[1]);
					//if names are equal, make new joined tuple and print to output file.
					//then break.
					if (temp0.name == temp1.name && !temp0.name.empty()) {
						output << make_tuple(temp0.name, temp0.age, temp1.salary);
						break;
					}
				} 
			}
			//if get all tuples from block, go to next block and get new tuple.
			if (block[0].eof()) {
				break;
			} 
		}
	}


	/******************************************************************/

	output.close();

	
}
