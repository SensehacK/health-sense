import React, { Fragment, Component } from "react";
import './header.css';

class Header extends Component {
    state = {
        id: true,
        session: 'Login'
    };

    doSomething = (e) => {
        e.preventDefault();

        if (this.state.id) {
            console.log("id is true");
            this.setState({
                session: 'Logout',
                id: false
            });

        } else {
            console.log("id is false");
            this.setState({
                session: 'Login',
                id: true
            });
        }

    }

    render() {
        return (
            <Fragment>
                <nav className="navContainer">
                    <div className="logoContainer gradientText">
                        <div className="brandName">
                            <h3>Health Sense</h3>
                        </div>
                    </div>
                    <div className="linkConatiner">
                        <ul className="links gradientText">
                            <a href="#">
                                <li>Home</li>
                            </a>
                            <a href="#Projects">
                                <li>Profile</li>
                            </a>
                            <a href='' onClick={this.doSomething}>
                                <li>{this.state.session}</li>
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
