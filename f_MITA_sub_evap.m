function [ MITA ] = f_MITA_sub_evap( N_part,Cfluid,CPROP,m_c,p_c,T_c_in,T_c_out,h_c_in,h_c_out,...
    Hfluid,HPROP,m_h,p_h,T_h_in,T_h_out,h_h_in,h_h_out )

MITA_hot=T_h_in-T_c_out;
MITA_cold=T_h_out-T_c_in;

h_c_sat_l=HPQ(p_c,0,Cfluid,CPROP);
T_c_sat_l=TPQ(p_c,0,Cfluid,CPROP);
h_h_sat_l=h_h_out+(h_c_sat_l-h_c_in)*m_c/m_h;
T_h_sat_l=TPH(p_h,h_h_sat_l,Hfluid,HPROP);
MITA_sat_l=T_h_sat_l-T_c_sat_l;


MITA=min([MITA_hot,MITA_cold,MITA_sat_l]);
end