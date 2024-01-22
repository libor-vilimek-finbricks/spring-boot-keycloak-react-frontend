package cz.finbricks.examples.springkeycloak;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.web.bind.annotation.*;


@RestController
@CrossOrigin(origins = "*")
public class ExampleController {
    @GetMapping
    @RequestMapping(value = "/secured/userId", method = RequestMethod.GET)
    @CrossOrigin(origins = "*")
    public String keyCloakAuthorize() {
        var credentials = (Jwt) SecurityContextHolder.getContext().getAuthentication().getCredentials();
        return credentials.getSubject();
    }
}
