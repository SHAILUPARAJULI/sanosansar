import React from "react";
import {
  Box,
  Container,
  Stack,
  SimpleGrid,
  Text,
  Link,
  VisuallyHidden,
  chakra,
  useColorModeValue,
  Image,
  Button,
} from "@chakra-ui/react";
import five from "../Images/fo.png";

import {
  FaTwitter,
  FaYoutube,
  FaInstagram,
  FaLinkedin,
  FaFacebook,
} from "react-icons/fa";

const ListHeader = ({ children }) => {
  return (
    <Text fontWeight={"500"} fontSize={"lg"} mb={2}>
      {children}
    </Text>
  );
};

const SocialButton = ({ children, label, href }) => {
  return (
    <chakra.button
      bg={useColorModeValue("blackAlpha.100", "whiteAlpha.100")}
      rounded={"full"}
      w={9}
      h={8}
      cursor={"pointer"}
      as={"a"}
      href={href}
      display={"inline-flex"}
      alignItems={"center"}
      justifyContent={"center"}
      transition={"background 0.3s ease"}
      _hover={{
        bg: useColorModeValue("blackAlpha.200", "whiteAlpha.200"),
      }}
    >
      <VisuallyHidden>{label}</VisuallyHidden>
      {children}
    </chakra.button>
  );
};
const Footer = () => {
  return (
    <Box
      bg={useColorModeValue("#6504b5", "gray.900")}
      color={useColorModeValue("#ffffff", "gray.200")}
    >
      <Box
        borderTopWidth={1}
        borderStyle={"solid"}
        borderColor={useColorModeValue("gray.200", "gray.700")}
      >
        <Container
          as={Stack}
          maxW={"6xl"}
          py={4}
          direction={{ base: "column", md: "row" }}
          spacing={4}
          justify={{ md: "space-between" }}
          align={{ md: "center" }}
        >
          <Text>©2023 SanoSansaar All trademarks are owned by Sanosansaar</Text>
          <Stack direction={"row"} spacing={6}>
            <SocialButton label={"Facebook"} href={"#"}>
              <FaFacebook />
            </SocialButton>
            <SocialButton label={"Twitter"} href={"#"}>
              <FaTwitter />
            </SocialButton>
            <SocialButton label={"YouTube"} href={"#"}>
              <FaYoutube />
            </SocialButton>
            <SocialButton label={"Instagram"} href={"#"}>
              <FaInstagram />
            </SocialButton>
            <SocialButton label={"Linkedin"} href={"#"}>
              <FaLinkedin />
            </SocialButton>
          </Stack>
        </Container>
      </Box>
    </Box>
  );
};

export default Footer;
