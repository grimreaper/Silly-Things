#include <SFML/System.hpp>
#include <SFML/Audio.hpp>
#include <SFML/Graphics.hpp>
#include <iostream>

int main()
{

	// Create the main window
	sf::RenderWindow App(sf::VideoMode(800, 600), "SFML window");
	
	sf::Image Image;
	if (!Image.LoadFromFile("ship.png"))
		return EXIT_FAILURE;
	sf::Sprite Sprite(Image);

	unsigned int ship_x = 0;
	unsigned int ship_y = 0;

	while (App.IsOpened())
	{

		Sprite.setPosition(ship_x,ship_y);

		 // Process events
		 sf::Event Event;
		 while (App.GetEvent(Event))
		 {
			 // Close window : exit
			 if (Event.Type == sf::Event::Closed)
				 App.Close();
		 }

		 // Clear screen
         App.Clear(sf::Color(200,0,0));

		 // Draw the sprite
		 App.Draw(Sprite);

		App.Display();
	}

	return EXIT_SUCCESS;
}

