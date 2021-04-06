// (C) 2001-2017 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// $Id: //acds/main/ip/sopc/components/verification/altera_tristate_conduit_bfm/altera_tristate_conduit_bfm.sv.terp#7 $
// $Revision: #7 $
// $Date: 2010/08/05 $
// $Author: klong $
//-----------------------------------------------------------------------------
// =head1 NAME
// altera_conduit_bfm
// =head1 SYNOPSIS
// Bus Functional Model (BFM) for a Standard Conduit BFM
//-----------------------------------------------------------------------------
// =head1 DESCRIPTION
// This is a Bus Functional Model (BFM) for a Standard Conduit Master.
// This BFM sampled the input/bidirection port value or driving user's value to 
// output ports when user call the API.  
// This BFM's HDL is been generated through terp file in Qsys/SOPC Builder.
// Generation parameters:
// output_name:                                       altera_conduit_bfm
// role:width:direction:                              conduit0:7:input,conduit1:7:input,conduit2:7:input,conduit3:7:input,conduit4:7:input,conduit5:7:input,conduit6:7:input,conduit7:7:input
// 0
//-----------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module altera_conduit_bfm
(
   sig_conduit0,
   sig_conduit1,
   sig_conduit2,
   sig_conduit3,
   sig_conduit4,
   sig_conduit5,
   sig_conduit6,
   sig_conduit7
);

   //--------------------------------------------------------------------------
   // =head1 PINS 
   // =head2 User defined interface
   //--------------------------------------------------------------------------
   input [6 : 0] sig_conduit0;
   input [6 : 0] sig_conduit1;
   input [6 : 0] sig_conduit2;
   input [6 : 0] sig_conduit3;
   input [6 : 0] sig_conduit4;
   input [6 : 0] sig_conduit5;
   input [6 : 0] sig_conduit6;
   input [6 : 0] sig_conduit7;

   // synthesis translate_off
   import verbosity_pkg::*;
   
   typedef logic [6 : 0] ROLE_conduit0_t;
   typedef logic [6 : 0] ROLE_conduit1_t;
   typedef logic [6 : 0] ROLE_conduit2_t;
   typedef logic [6 : 0] ROLE_conduit3_t;
   typedef logic [6 : 0] ROLE_conduit4_t;
   typedef logic [6 : 0] ROLE_conduit5_t;
   typedef logic [6 : 0] ROLE_conduit6_t;
   typedef logic [6 : 0] ROLE_conduit7_t;

   logic [6 : 0] sig_conduit0_in;
   logic [6 : 0] sig_conduit0_local;
   logic [6 : 0] sig_conduit1_in;
   logic [6 : 0] sig_conduit1_local;
   logic [6 : 0] sig_conduit2_in;
   logic [6 : 0] sig_conduit2_local;
   logic [6 : 0] sig_conduit3_in;
   logic [6 : 0] sig_conduit3_local;
   logic [6 : 0] sig_conduit4_in;
   logic [6 : 0] sig_conduit4_local;
   logic [6 : 0] sig_conduit5_in;
   logic [6 : 0] sig_conduit5_local;
   logic [6 : 0] sig_conduit6_in;
   logic [6 : 0] sig_conduit6_local;
   logic [6 : 0] sig_conduit7_in;
   logic [6 : 0] sig_conduit7_local;

   //--------------------------------------------------------------------------
   // =head1 Public Methods API
   // =pod
   // This section describes the public methods in the application programming
   // interface (API). The application program interface provides methods for 
   // a testbench which instantiates, controls and queries state in this BFM 
   // component. Test programs must only use these public access methods and 
   // events to communicate with this BFM component. The API and module pins
   // are the only interfaces of this component that are guaranteed to be
   // stable. The API will be maintained for the life of the product. 
   // While we cannot prevent a test program from directly accessing internal
   // tasks, functions, or data private to the BFM, there is no guarantee that
   // these will be present in the future. In fact, it is best for the user
   // to assume that the underlying implementation of this component can 
   // and will change.
   // =cut
   //--------------------------------------------------------------------------
   
   event signal_input_conduit0_change;
   event signal_input_conduit1_change;
   event signal_input_conduit2_change;
   event signal_input_conduit3_change;
   event signal_input_conduit4_change;
   event signal_input_conduit5_change;
   event signal_input_conduit6_change;
   event signal_input_conduit7_change;
   
   function automatic string get_version();  // public
      // Return BFM version string. For example, version 9.1 sp1 is "9.1sp1" 
      string ret_version = "17.1";
      return ret_version;
   endfunction

   // -------------------------------------------------------
   // conduit0
   // -------------------------------------------------------
   function automatic ROLE_conduit0_t get_conduit0();
   
      // Gets the conduit0 input value.
      $sformat(message, "%m: called get_conduit0");
      print(VERBOSITY_DEBUG, message);
      return sig_conduit0_in;
      
   endfunction

   // -------------------------------------------------------
   // conduit1
   // -------------------------------------------------------
   function automatic ROLE_conduit1_t get_conduit1();
   
      // Gets the conduit1 input value.
      $sformat(message, "%m: called get_conduit1");
      print(VERBOSITY_DEBUG, message);
      return sig_conduit1_in;
      
   endfunction

   // -------------------------------------------------------
   // conduit2
   // -------------------------------------------------------
   function automatic ROLE_conduit2_t get_conduit2();
   
      // Gets the conduit2 input value.
      $sformat(message, "%m: called get_conduit2");
      print(VERBOSITY_DEBUG, message);
      return sig_conduit2_in;
      
   endfunction

   // -------------------------------------------------------
   // conduit3
   // -------------------------------------------------------
   function automatic ROLE_conduit3_t get_conduit3();
   
      // Gets the conduit3 input value.
      $sformat(message, "%m: called get_conduit3");
      print(VERBOSITY_DEBUG, message);
      return sig_conduit3_in;
      
   endfunction

   // -------------------------------------------------------
   // conduit4
   // -------------------------------------------------------
   function automatic ROLE_conduit4_t get_conduit4();
   
      // Gets the conduit4 input value.
      $sformat(message, "%m: called get_conduit4");
      print(VERBOSITY_DEBUG, message);
      return sig_conduit4_in;
      
   endfunction

   // -------------------------------------------------------
   // conduit5
   // -------------------------------------------------------
   function automatic ROLE_conduit5_t get_conduit5();
   
      // Gets the conduit5 input value.
      $sformat(message, "%m: called get_conduit5");
      print(VERBOSITY_DEBUG, message);
      return sig_conduit5_in;
      
   endfunction

   // -------------------------------------------------------
   // conduit6
   // -------------------------------------------------------
   function automatic ROLE_conduit6_t get_conduit6();
   
      // Gets the conduit6 input value.
      $sformat(message, "%m: called get_conduit6");
      print(VERBOSITY_DEBUG, message);
      return sig_conduit6_in;
      
   endfunction

   // -------------------------------------------------------
   // conduit7
   // -------------------------------------------------------
   function automatic ROLE_conduit7_t get_conduit7();
   
      // Gets the conduit7 input value.
      $sformat(message, "%m: called get_conduit7");
      print(VERBOSITY_DEBUG, message);
      return sig_conduit7_in;
      
   endfunction

   assign sig_conduit0_in = sig_conduit0;
   assign sig_conduit1_in = sig_conduit1;
   assign sig_conduit2_in = sig_conduit2;
   assign sig_conduit3_in = sig_conduit3;
   assign sig_conduit4_in = sig_conduit4;
   assign sig_conduit5_in = sig_conduit5;
   assign sig_conduit6_in = sig_conduit6;
   assign sig_conduit7_in = sig_conduit7;


   always @(sig_conduit0_in) begin
      if (sig_conduit0_local != sig_conduit0_in)
         -> signal_input_conduit0_change;
      sig_conduit0_local = sig_conduit0_in;
   end
   
   always @(sig_conduit1_in) begin
      if (sig_conduit1_local != sig_conduit1_in)
         -> signal_input_conduit1_change;
      sig_conduit1_local = sig_conduit1_in;
   end
   
   always @(sig_conduit2_in) begin
      if (sig_conduit2_local != sig_conduit2_in)
         -> signal_input_conduit2_change;
      sig_conduit2_local = sig_conduit2_in;
   end
   
   always @(sig_conduit3_in) begin
      if (sig_conduit3_local != sig_conduit3_in)
         -> signal_input_conduit3_change;
      sig_conduit3_local = sig_conduit3_in;
   end
   
   always @(sig_conduit4_in) begin
      if (sig_conduit4_local != sig_conduit4_in)
         -> signal_input_conduit4_change;
      sig_conduit4_local = sig_conduit4_in;
   end
   
   always @(sig_conduit5_in) begin
      if (sig_conduit5_local != sig_conduit5_in)
         -> signal_input_conduit5_change;
      sig_conduit5_local = sig_conduit5_in;
   end
   
   always @(sig_conduit6_in) begin
      if (sig_conduit6_local != sig_conduit6_in)
         -> signal_input_conduit6_change;
      sig_conduit6_local = sig_conduit6_in;
   end
   
   always @(sig_conduit7_in) begin
      if (sig_conduit7_local != sig_conduit7_in)
         -> signal_input_conduit7_change;
      sig_conduit7_local = sig_conduit7_in;
   end
   


// synthesis translate_on

endmodule

