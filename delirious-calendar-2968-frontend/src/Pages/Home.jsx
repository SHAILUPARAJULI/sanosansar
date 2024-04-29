import { Box, Button, Heading, Stack, Text, Input } from "@chakra-ui/react";
import React from "react";
import one from "../Images/1.png";
import two from "../Images/2.png";
import three from "../Images/3.png";
import four from "../Images/4.png";
import homepic from "../image/homepage.avif";
import { Link } from "react-router-dom";
const Home = () => {
  return (
    <Box width={"100%"}>
      <Box border={"3px solid #6504b5"}>
        <div style={{ position: "relative" }}>
          <img
            width="100%"
            height="100%"
            src={homepic}
            alt=""
            style={{ position: "absolute", top: 0, left: 0, zIndex: -1 }}
          />
          <div
            style={{
              display: "flex",
              justifyContent: "center",
              marginTop: "0",
              position: "relative",
              zIndex: 1,
            }}
          >
            <div style={{ marginRight: "10px" }}>
              <Input
                position="relative"
                width={500}
                marginTop="20%"
                h={50}
                bg="white"
                justifyContent={"left"}
                border={"3px solid #6504b5"}
                placeholder="Search Terrier, Kitten, etc."
              ></Input>
            </div>
            <div>
              <Input
                h={50}
                placeholder="Asan Maina Municipality"
                border={"2.5px solid #6504b5"}
                position="relative"
                marginTop="20%"
                bg="white"
                justifyContent={"left"}
                width={500}
              ></Input>
            </div>
          </div>
        </div>

        <Heading
          position="relative"
          top={["10%", "50%", "50%", "7%"]}
          textAlign="center"
          p={"20px 300px"}
          padding={"10% 0 11% 0"}
          color="white"
          textShadow="1px 1px 2px #000, 0 0 1em #000" // Add textShadow property for stroke
        >
          Connecting Hearts and Homes: Where Pets Find Their Perfect Match!
        </Heading>
        <Box
          position="relative"
          top="50%"
          left="50%"
          transform="translate(-50%, -50%)"
        >
          <Box padding={"13% 17% -10% 17%"}>
            <Stack
              direction={{ ms: "column", md: "row" }}
              justifyContent={"space-evenly"}
              gap={"50px"}
            >
              <Box boxSize={150} p={1}>
                <Link to={"/dogadopt"}>
                  <img
                    src={one}
                    alt="1"
                    style={{ boxShadow: "rgba(0, 0, 0, 0.35) 0px 5px 15px" }}
                  />
                </Link>
              </Box>
              <Box boxSize={150} p={1}>
                <Link to={"/catadopt"}>
                  <img
                    src={two}
                    alt="2"
                    s
                    style={{ boxShadow: "rgba(0, 0, 0, 0.35) 0px 5px 15px" }}
                  />
                </Link>
              </Box>
              <Box boxSize={160} p={1}>
                <img
                  src={three}
                  alt="3"
                  style={{ boxShadow: "rgba(0, 0, 0, 0.35) 0px 5px 15px" }}
                />
              </Box>
              <Box boxSize={160} p={1}>
                <img
                  src={four}
                  alt="4"
                  style={{ boxShadow: "rgba(0, 0, 0, 0.35) 0px 5px 15px" }}
                />
              </Box>
            </Stack>
          </Box>
        </Box>
      </Box>
      <Box bg={"#EDE7F6"}>
        <Heading color={"#6504b5"} p={"5% 20%"}>
          Pets Available for Adoption Nearby
        </Heading>
        <Stack
          direction={{ base: "column", md: "row" }}
          gap={"10%"}
          padding={30}
        >
          <Box>
            <img
              style={{
                width: "100%",
                height: "70%",
                objectFit: "cover",
                /* Optional: Position the image within the container */
                //   position: "absolute",
                //   top: 0;
                //   left: 0;
              }}
              src="https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/63291329/1/?bust=1683800934&width=316"
              alt=""
            />
            {/* <Text fontWeight={600}>Boo</Text> */}
            <Heading
              p={"20px 0px"}
              fontSize={"50px"}
              fontFamily={"body"}
              fontWeight={500}
              color={"purple"}
            >
              Boo
            </Heading>
            {/* <h2>Boo</h2> */}
          </Box>
          <Box>
            <img
              style={{
                width: "100%",
                height: "70%",
                objectFit: "cover",
              }}
              src="https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/64094873/1/?bust=1683454882&width=316"
              alt=""
            />
            <Heading
              p={"20px 0px"}
              fontSize={"50px"}
              fontFamily={"body"}
              fontWeight={500}
              color={"purple"}
            >
              Rallo
            </Heading>
          </Box>
          <Box>
            <img
              style={{
                width: "100%",
                height: "70%",
                objectFit: "cover",
              }}
              src="https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/59534213/1/?bust=1683800901&width=316"
              alt=""
            />
            <Heading
              p={"20px 0px"}
              fontSize={"50px"}
              fontFamily={"body"}
              fontWeight={500}
              color={"purple"}
            >
              Bravo
            </Heading>
          </Box>
          <Box>
            <img
              style={{
                width: "100%",
                height: "70%",
                objectFit: "cover",
              }}
              src="https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/55064029/1/?bust=1683800944&width=316"
              alt=""
            />
            <Heading
              p={"20px 0px"}
              fontSize={"50px"}
              fontFamily={"body"}
              fontWeight={500}
              color={"purple"}
            >
              Tullo
            </Heading>
          </Box>
        </Stack>
      </Box>

      <Box margin={"150px 100px"}>
        <Heading
          textAlign="center"
          fontFamily="arial helvetica "
          //  line-height: 1.2;
          //  font-size: 30px;
          //  font-weight: 400;
          color="#4d4751"
          //  margin-bottom: 40px;
        >
          Planning to Adopt a Pet?
        </Heading>
        <Stack
          direction={{ base: "column", md: "row" }}
          gap={"80px"}
          justifyContent={"center"}
        >
          <Box w={400}>
            <Heading
              color={"#004c81"}
              fontSize={"20px"}
              pt={10}
              fontFamily={"Nexa-Bold"}
              fontWeight={400}
            >
              Checklist for New Adopters
            </Heading>
            <Text>Help make the transition, as smooth as possible.</Text>
            <Button
              m={10}
              bg={"white"}
              border={"2px solid #20ccf8"}
              color="#004c81"
              borderRadius={"12rem"}
            >
              <a href="https://www.thesprucepets.com/what-to-do-before-adopting-dog-7852996">
                Learn More
              </a>
            </Button>
          </Box>
          <Box w={400}>
            <Heading
              color={"#004c81"}
              fontSize={"20px"}
              pt={10}
              fontFamily={"Nexa-Bold"}
              fontWeight={400}
            >
              COVID-19 Resources
            </Heading>
            <Text>
              Get the latest on adoption processes, learn how local shelters and
              rescue groups are adapting and find out what you can do to help
              dogs and cats in need right now.
            </Text>
            <Button
              m={10}
              bg={"white"}
              border={"2px solid #20ccf8"}
              color="#004c81"
              borderRadius={"12rem"}
            >
              Learn More
            </Button>
            {/* <Button m={10} >Learn More</Button> */}
          </Box>
          <Box w={300}>
            <Heading
              color={"#004c81"}
              fontSize={"20px"}
              pt={10}
              fontFamily={"Nexa-Bold"}
              fontWeight={400}
            >
              Pet Adoption FAQs
            </Heading>
            <Text>Get answers to questions you haven't thought of.</Text>
            <Button
              m={10}
              bg={"white"}
              border={"2px solid #20ccf8"}
              color="#004c81"
              borderRadius={"12rem"}
            >
              <a href="https://animalfoundation.com/adopt-a-pet/adoption-info-faqs">
                Learn More
              </a>
            </Button>
            {/* <Button m={10}>Learn More</Button> */}
          </Box>
        </Stack>
      </Box>
      <Box p={10}>
        <Stack direction={{ base: "column", md: "row" }}>
          <Box
            boxShadow="rgba(0, 0, 0, 0.35) 0px 5px 15px"
            borderRadius={"25px"}
          >
            <img
              style={{ borderRadius: "25px" }}
              src="https://www.petfinder.com/sites/default/files/styles/card/public/images/content/47.jpeg?itok=HNT_yv1F"
              alt=""
            />
            <Heading p={5}>Dogs Adoption Article</Heading>
            <Text p={5}>Learn about caring for your new dog</Text>
            <Button
              m={10}
              bg={"white"}
              border={"2px solid #20ccf8"}
              p={"10px 150px"}
              color="#004c81"
              borderRadius={"12rem"}
            >
              Learn More
            </Button>
            {/* <Button m={5}>LEARN MORE</Button> */}
          </Box>
          <Box
            boxShadow="rgba(0, 0, 0, 0.35) 0px 5px 15px"
            borderRadius={"25px"}
          >
            <img
              style={{ borderRadius: "25px" }}
              src="https://www.petfinder.com/sites/default/files/styles/card/public/images/content/PF2015_267_Kittens_Shelter-630.jpg?itok=JGTdJJaD"
              alt=""
            />
            <Heading p={5}>Cat Adoption Article</Heading>
            <Text p={5}>Helpful insights on what to expect</Text>
            <Button
              m={10}
              bg={"white"}
              border={"2px solid #20ccf8"}
              p={"10px 150px"}
              color="#004c81"
              borderRadius={"12rem"}
            >
              Learn More
            </Button>
            {/* <Button m={5}>LEARN MORE</Button> */}
          </Box>
        </Stack>
      </Box>
    </Box>
  );
};

export default Home;
