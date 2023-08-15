#include <iostream>
#include <vector>
#include <string>


int main(int argc, char *argv[ ]){
    std::vector<std::string> msg {"Hello", "World!"};

    if(argc > 1){
        std::cout << "Foram informados " + std::to_string(argc - 1) + " argumentos." << std::endl;
        
        for(int i = 1; i < argc; ++i){
            msg.push_back(argv[i]);
        }
    } 

    for (const std::string & word : msg){
        std::cout << word << " ";
    }

    std::cout << std::endl;
}


                // for(std::vector<std::string>::iterator it = msg.begin(); it != msg.end(); it++)
                //     {
                //         msg.push_back(argv[0]);
                //     }