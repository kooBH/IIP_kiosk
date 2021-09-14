#ifndef _H_MB1434_
#define _H_MB1434_

#include <thread>
#include "serial/serial.h"

#include <vector>
#include <map>

using std::vector;
using std::string;
using std::map;
using std::make_pair;

class MB1434 {
    private :
        map<string,unsigned int> map_serial_device;
        std::thread * t_run;

    public :
        inline MB1434();
        inline ~MB1434();
    inline void Serialprobe();

};

MB1434::MB1434(){

}

MB1434::~MB1434(){


}

inline void MB1434::Serialprobe(){  

  vector<serial::PortInfo> devices_found = serial::list_ports();

  vector<serial::PortInfo>::iterator iter = devices_found.begin();
  //printf("Found %lu Devices\n", devices_found.size());
  //printf("=======================\n");
  map_serial_device.clear();
  int i = 0;
  while (iter != devices_found.end()) {
    serial::PortInfo device = *iter++;
    if (strcmp("n/a", device.hardware_id.c_str())){
      map_serial_device.insert(make_pair(device.port.c_str(), i));
      i++;
      text_device.append("\nPort = ");
      text_device.append(QString::fromStdString(device.port.c_str())); 
      text_device.append("\ndescription = ");
      text_device.append(QString::fromStdString(device.description.c_str())); 
      text_device.append("\nhardware ID = ");
      text_device.append(QString::fromStdString(device.hardware_id.c_str()));
      text_device.append("\n"); 
    }
  }
  combo_serial.clear();
  for(auto it = map_serial_device.begin();it !=map_serial_device.end();it++){
    combo_serial.addItem( QString::fromStdString(it->first));
  }
  TB_device.setText(text_device);
}



#endif 
