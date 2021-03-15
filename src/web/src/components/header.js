import React, { Fragment, Component } from "react";
import './header.css';

class Header extends Component {
    state = {};

    render() {
        return (
            <Fragment>
                <nav class="navContainer">
                    <div class="logoContainer gradientText">
                        <div class="brandName">
                            <h3>Health Sense</h3>
                        </div>
                    </div>
                    <div class="linkConatiner">
                        <ul class="links gradientText">
                            <a href="#">
                                <li>Home</li>
                            </a>
                            <a href="#Projects">
                                <li>Profile</li>
                            </a>

                        </ul>
                    </div>
                </nav>
            </Fragment>
        );
    }
}

const styles = {

};
export default Header;
