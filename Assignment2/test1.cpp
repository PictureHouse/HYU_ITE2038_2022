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
	int current_block[2] = {};
	fstream block[12];
	ofstream output;

	output.open("./output1.csv");

	if(output.fail())
	{
		cout << "output file opening fail.\n";
	}

	/*********************************************************************************/
	

	int count0 = 0, index0 = 0;
	int count1 = 0, index1 = 0;

	while (count0 < 1000 && count1 < 1000) {
		//close existing opened file, then open new .csv file from name_age.
		for (int i = 0; i < 5; i++) {
			block[i].close();
			block[i].open("./name_age/" + to_string(count0) + ".csv", ios::in);
			//if failed to open, print error message.
			if (block[i].fail()) {
				cout << "input file opening fail.\n";
				break;
			} 
			else {
				count0++;
				index0 = 0;
			}
		}

		//close existing opened file, then open new .csv file from name_salary.
		for (int j = 0; j < 5; j++) {
			block[j + 5].close();
			block[j + 5].open("./name_salary/" + to_string(count1) + ".csv", ios::in);
			//if failed to open, print error message.
			if (block[j + 5].fail()) {
				cout << "input file opening fail.\n";
				break;
			} 
			else {
				count1++;
				index1 = 5;
			}
		}

		//traverse all blocks in block array(currently on memory).
		while (index0 < 5 && index1 < 10) {
			//get tuple from block.
			if (index0 % 5 == 0) {
				getline(block[index0], buffer[0]);
				temp0.set_name_age(buffer[0]);
			}
            		if (index1 % 5 == 0) {
				getline(block[index1], buffer[1]);
				temp1.set_name_salary(buffer[1]);
			}

			//do merge join.
			while (true) {
				//if names are equal, make new joined tuple and print to output file.
				//and then get next tuple from name_age.
				if (temp0.name == temp1.name && !temp0.name.empty()) {
                    			output << make_tuple(temp0.name, temp0.age, temp1.salary);
                    			getline(block[index0], buffer[0]);
					temp0.set_name_age(buffer[0]);
                } 
				//if name_salary tuple's name is bigger, get next tuple from name_age.
				else if (temp0.name < temp1.name) {
					getline(block[index0], buffer[0]);
					temp0.set_name_age(buffer[0]);
                } 
				//if name_age tuple's name is bigger, get next tuple from name_salary.
				else {
                    			getline(block[index1], buffer[1]);
					temp1.set_name_salary(buffer[1]);
                }
				
				//if get all tuples from block, go to next block and get new tuple.
				if (block[index0].eof()) {
					index0++;
					break;
				} 
				if (block[index1].eof()) {
					index1++;
                    break;
                }
			}
		}
	}


	/*********************************************************************************/


	output.close();
}
