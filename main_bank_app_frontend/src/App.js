import "./App.css";
import { Route, Routes } from "react-router-dom";
import AboutUs from "./page/AboutUs";
import ContactUs from "./page/ContactUs";
import Header from "./NavbarComponent/Header";
import HomePage from "./page/HomePage";
import UserRegister from "./UserComponent/UserRegister";
import UserLoginForm from "./UserComponent/UserLoginForm";
import AdminRegisterForm from "./UserComponent/AdminRegisterForm";
import AddBankForm from "./BankComponent/AddBankForm";
import ViewAllBanks from "./BankComponent/ViewAllBanks";
import ViewBankManagers from "./UserComponent/ViewBankManagers";
import ViewAllBankCustomers from "./UserComponent/ViewAllBankCustomers";
import ViewBankAccount from "./BankAccountComponent/ViewBankAccount";
import ViewBankCustomers from "./UserComponent/ViewBankCustomers";
import ViewAllBankAccounts from "./BankAccountComponent/ViewAllBankAccounts";
import ViewBankAccounts from "./BankAccountComponent/ViewBankAccounts";
import AddBankAccount from "./BankAccountComponent/AddBankAccount";
import ViewBankAllTransactions from "./BankTransactionComponent/ViewBankAllTransactions";
import ViewCustomerTransactions from "./BankTransactionComponent/ViewCustomerTransactions";
import ViewAllBankTransactions from "./BankTransactionComponent/ViewAllBankTransactions";
import CustomerAccountFundTransfer from "./BankTransactionComponent/CustomerAccountFundTransfer";

function App() {
  return (
    <div>
      <Header />
      <Routes>
        <Route path="/" element={<HomePage />} />
        <Route path="/home" element={<HomePage />} />
        <Route path="/home/all/hotel/location" element={<HomePage />} />
        <Route path="contact" element={<ContactUs />} />
        <Route path="about" element={<AboutUs />} />
        <Route path="/user/customer/register" element={<UserRegister />} />
        <Route path="/user/bank/register" element={<UserRegister />} />
        <Route path="/user/login" element={<UserLoginForm />} />
        <Route path="/user/admin/register" element={<AdminRegisterForm />} />
        <Route path="/admin/bank/register" element={<AddBankForm />} />
        <Route path="/admin/bank/all" element={<ViewAllBanks />} />
        <Route path="/admin/bank/managers" element={<ViewBankManagers />} />
        <Route
          path="/admin/all/bank/customers"
          element={<ViewAllBankCustomers />}
        />
        <Route path="/bank/customer/all" element={<ViewBankCustomers />} />
        <Route
          path="customer/bank/account/detail"
          element={<ViewBankAccount />}
        />
        <Route
          path="/admin/bank/account/all"
          element={<ViewAllBankAccounts />}
        />
        <Route path="/bank/account/all" element={<ViewBankAccounts />} />
        <Route path="/bank/customer/account/add" element={<AddBankAccount />} />
        <Route
          path="/bank/customer/account/transactions"
          element={<ViewBankAllTransactions />}
        />

        <Route
          path="/customer/bank/account/statement"
          element={<ViewCustomerTransactions />}
        />
        <Route
          path="/admin/bank/customer/transaction/all"
          element={<ViewAllBankTransactions />}
        />
        <Route
          path="/customer/account/transfer"
          element={<CustomerAccountFundTransfer />}
        />
      </Routes>
    </div>
  );
}

export default App;
