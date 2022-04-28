#include <iostream>
#include <GL/glew.h>
#include <SFML/Graphics.hpp>
#include <SFML/OpenGL.hpp>

int main(int argc, char* argv[])
{
    // Request a 24-bits depth buffer when creating the window
    sf::ContextSettings contextSettings;
    contextSettings.depthBits = 24;
    contextSettings.sRgbCapable = false;

    sf::RenderWindow window(sf::VideoMode(800, 600), "SFML window", sf::Style::Default, contextSettings);
    window.setVerticalSyncEnabled(true);
    window.setActive(true);

    // GLEW 
    GLenum err = glewInit();
    if(GLEW_OK != err)
    {
        std::cout << "Error Loading Glew" << std::endl;
    }
    else
    {
        std::cout << "Glew Loaded Success" << std::endl;
    }

    sf::Event event;
    while (window.isOpen())
    {
        event = sf::Event();
        while (window.pollEvent(event))
        {
            // Close window: exit
            if (event.type == sf::Event::Closed)
            {    window.close();
            }
            else if(event.type == sf::Event::Resized)
            {
                glViewport(0,0, event.size.width, event.size.height);
            }
            
        }
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
        glClearColor(255, 255, 0, 1);
        window.display();
        sf::sleep(sf::milliseconds(10));
    }
    window.setActive(false);
    return EXIT_SUCCESS;
}