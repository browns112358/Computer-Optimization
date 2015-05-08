#include <arrayfire.h>
#include <cstdio>
#include <cstdlib>
#include <fstream>
#include <sstream>
#include <af/util.h>
#include <math.h>

using namespace af;
using namespace std;

int main(int argc, char *argv[])
{
	float data[65][3];  //size of Master_data.csv
	float pop_temp[62], lat_temp[62], long_temp[62];
	std::ifstream file("data1.csv");

	for(int row=0; row<65; ++row)
	{
		std::string line;
		std::getline(file, line);
		if( !file.good() )	break;
		std::stringstream iss(line);
		for( int col=0; col<3; ++col)
		{
			std::string val;
			std::getline(iss, val, ',');
			if(!iss.good())	break;
			std::stringstream converter(val);
			converter >> data[row][col];
		}
	}
	for(int i=0;i<63; i++)
	{
		lat_temp[i]=data[i+1][1];
		long_temp[i]=data[i+1][2];
		pop_temp[i]=data[i+1][0];
	}
	array Lat(62,1,lat_temp);
	array Long(62,1,long_temp);
	array Pop(62,1,pop_temp);
	array remote(62);


	gfor(seq i, 62)
	{
		array Lat_static=constant(1, 62)*Lat(i)+ 0.00001;
		array Long_static=constant(1,62)*Long(i)+0.00001;

		array distance=sqrt( pow(Lat-Lat_static,2) + pow(abs(Long)-abs(Long_static),2)  ) ;
		distance=Pop*pow(distance,-1);

		remote(i)=sum(distance)-distance(i);
	}

af_print(remote);

    	return 0;
}
