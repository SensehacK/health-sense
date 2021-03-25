import React, { Fragment, Component } from "react";
import { CircularProgressbar } from 'react-circular-progressbar';
import 'react-circular-progressbar/dist/styles.css';
import './dashboard.css';


class Dashboard extends Component {
    state = {
        water: {
            title: 'Water',
            percentage: 20
        },
        sleep: {
            title: 'Sleep',
            percentage: 30
        },
        heart: {
            title: 'Running',
            percentage: 60
        },
        walk: {
            title: 'Walk',
            percentage: 80
        }
    };

    render() {
        return (
            <Fragment>
                <div className="dashboard-container">
                    <div className="dashboard-Header">
                        <h2>Hello Abbas</h2>
                        <p>last syncyed at March 24 2021</p>
                    </div>
                    <div className="dashboard-data">
                        <div className="user-activity">
                            <CircularProgressbar
                                value={this.state.water.percentage}
                                text={this.state.water.title}
                                background='true'
                                styles={{
                                    path: {
                                        // Path color
                                        stroke: '#0E7C7B',
                                        strokeLinecap: 'butt',
                                    },
                                    trail: {
                                        // Trail color
                                        stroke: '#D4D2D5 ',
                                    },
                                    text: {
                                        // Text color
                                        fill: '#394053',
                                        // Text size
                                        fontSize: '16px',
                                    },
                                    // Customize background - only used when the `background` prop is true
                                    background: {
                                        fill: '#17BEBB',
                                    },
                                }}
                            />
                        </div>
                        <div className="user-activity">
                            <CircularProgressbar
                                value={this.state.sleep.percentage}
                                text={this.state.sleep.title}
                                background='true'
                                styles={{
                                    path: {
                                        // Path color
                                        stroke: '#0E7C7B',
                                        strokeLinecap: 'butt',
                                    },
                                    trail: {
                                        // Trail color
                                        stroke: '#D4D2D5 ',
                                    },
                                    text: {
                                        // Text color
                                        fill: '#394053',
                                        // Text size
                                        fontSize: '16px',
                                    },
                                    // Customize background - only used when the `background` prop is true
                                    background: {
                                        fill: '#17BEBB',
                                    },
                                }}
                            />
                        </div>
                        <div className="user-activity">
                            <CircularProgressbar
                                value={this.state.heart.percentage}
                                text={this.state.heart.title}
                                background='true'
                                styles={{
                                    path: {
                                        // Path color
                                        stroke: '#0E7C7B',
                                        strokeLinecap: 'butt',
                                    },
                                    trail: {
                                        // Trail color
                                        stroke: '#D4D2D5 ',
                                    },
                                    text: {
                                        // Text color
                                        fill: '#394053',
                                        // Text size
                                        fontSize: '16px',
                                    },
                                    // Customize background - only used when the `background` prop is true
                                    background: {
                                        fill: '#17BEBB',
                                    },
                                }}
                            />
                        </div>
                        <div className="user-activity">
                            <CircularProgressbar
                                value={this.state.walk.percentage}
                                text={this.state.walk.title}
                                background='true'
                                styles={{
                                    path: {
                                        // Path color
                                        stroke: '#0E7C7B',
                                        strokeLinecap: 'butt',
                                    },
                                    trail: {
                                        // Trail color
                                        stroke: '#D4D2D5 ',
                                    },
                                    text: {
                                        // Text color
                                        fill: '#394053',
                                        // Text size
                                        fontSize: '16px',
                                    },
                                    // Customize background - only used when the `background` prop is true
                                    background: {
                                        fill: '#17BEBB',
                                    },
                                }}
                            />
                        </div>
                    </div>
                </div>
            </Fragment>
        );
    }
}

const styles = {

};
export default Dashboard;
