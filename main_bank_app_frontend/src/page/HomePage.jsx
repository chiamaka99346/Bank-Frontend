import Carousel from "./Carousel";
import Footer from "./Footer";
import { Link } from "react-router-dom";
import travel_1 from "../images/banking_image3.png";
import travel_2 from "../images/banking_image2.png";

const HomePage = () => {
  return (
    <div className="container-fluid mb-2">
      <Carousel />

      <div className="container mt-5">
        <div className="row">
          <div className="col-md-8 text-color">
            <h1>Welcome to Online Banking System</h1>
            <p>
              Welcome to our cutting-edge Online Banking System, where financial
              empowerment meets technological innovation. Seamlessly navigate
              through your financial journey with ease, as you initiate secure
              transactions, conveniently deposit funds into your accounts, and
              effortlessly withdraw when needed.
            </p>
            <p>
              Our user-friendly interface ensures a smooth and intuitive
              experience, giving you full control over your finances from the
              comfort of your own device. With advanced security measures in
              place, you can trust that your sensitive information is
              safeguarded throughout every interaction. Join us on this digital
              financial expedition and unlock a new era of banking convenience
              and confidence.
            </p>
            <Link to="/user/login" className="btn bg-color custom-bg-text">
              Get Started
            </Link>
          </div>
          <div className="col-md-4">
            <img
              src={travel_2}
              alt="Logo"
              width="400"
              height="auto"
              className="home-image"
            />
          </div>
        </div>

        <div className="row mt-5">
          <div className="col-md-4">
            <img
              src={travel_1}
              alt="Logo"
              width="400"
              height="auto"
              className="home-image"
            />
          </div>
          <div className="col-md-8 text-color">
            <h1 className="ms-5">Experience Effortless Financial Management</h1>
            <p className="ms-5">
              Discover a new level of financial control through our intuitive
              Online Banking System. Seamlessly manage transactions, deposits,
              and withdrawals with a user-friendly interface designed to
              simplify your banking experience. Whether you're transferring
              funds, depositing savings, or making withdrawals, our platform
              ensures security and convenience at every step.
            </p>
            <p className="ms-5">
              Empower yourself with effortless financial management and enjoy
              the freedom to take charge of your accounts from the comfort of
              your own device. Join us in revolutionizing the way you interact
              with your finances, as we pave the way for a more streamlined and
              secure banking future.
            </p>
            <Link to="/user/login" className="btn bg-color custom-bg-text ms-5">
              Get Started
            </Link>
          </div>
        </div>
      </div>
      <hr />
      <Footer />
    </div>
  );
};

export default HomePage;
