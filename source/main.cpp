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

    sf::Font font;
    if (!font.loadFromFile("resource/font/Nouveau_IBM.ttf"))
        return EXIT_FAILURE;

    sf::Text text("Hello World", font);
    text.setFillColor(sf::Color(255, 0, 0, 170));
    text.setPosition({280.f, 450.f});

    // Enable Z-buffer read and write
    glEnable(GL_DEPTH_TEST);
    glDepthMask(GL_TRUE);
    glClearDepth(1.f);
    glViewport(0,0, 400, 300);

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
                glViewport(0,0, event.size.width/2, event.size.height/2);
                window.setView(sf::View(sf::FloatRect(0.f, 0.f, event.size.width, event.size.height)));
            }
            
        }
        glClearColor(255, 255, 0, 1);
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

        window.pushGLStates();
        window.draw(text);
        window.popGLStates();

        window.display();
        sf::sleep(sf::milliseconds(10));
    }
    window.setActive(false);
    return EXIT_SUCCESS;
}