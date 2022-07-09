function [PP] = PP_heater_search(N_part,Cfluid,CPROP,m_c,p_c,T_c_in,T_c_out,h_c_in,h_c_out,...
    Hfluid,HPROP,p_h,T_h_in,DT_h)
Q_hex=m_c*(h_c_out-h_c_in);
h_h_in=HPT(p_h,T_h_in,Hfluid,HPROP);
T_h_out=T_h_in-DT_h;
h_h_out=HPT(p_h,T_h_out,Hfluid,HPROP);
m_h=Q_hex/(h_h_in-h_h_out);
% PP=fMITA(N_part,Cfluid,CPROP,m_c,p_c,T_c_in,T_c_out,h_c_in,h_c_out,...
%     Hfluid,HPROP,m_h,p_h,T_h_in,T_h_out,h_h_in,h_h_out);
PP=f_MITA_sub_evap(N_part,Cfluid,CPROP,m_c,p_c,T_c_in,T_c_out,h_c_in,h_c_out,...
    Hfluid,HPROP,m_h,p_h,T_h_in,T_h_out,h_h_in,h_h_out);
end

