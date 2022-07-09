n=20;
A=zeros(n,n);
B=zeros(1,n);

%A matrix coefficients (T_st(t,1), T_st(t,2))
v=[M_st*cp_htf/(n*timestep)+m_col(t)*cp_htf+m_htf(t)*cp_htf+U_L*A_st(1),-m_htf(t)*cp_htf];

A(1,1:2)=v;
%B_matrix first element
B(1,1)=M_st*cp_htf/(n*timestep)*T_st(t-1,1)+U_L*A_st(1)*T_amb(t)+m_col(t)*cp_htf*T_col_out(t);

%A,B matrix building 
for i=2:n-1
    w=[-m_col(t)*cp_htf,M_st*cp_htf/(n*timestep)+m_col(t)*cp_htf+m_htf(t)*cp_htf+U_L*A_st(i),-m_htf(t)*cp_htf];
    A(i,i-1:i+1)=w;
    B(1,i)=M_st*cp_htf/(n*timestep)*T_st(t-1,i)+U_L*A_st(i)*T_amb(t);
end

%A zone matrix coefficients last zone
u=[-m_col(t)*cp_htf,M_st*cp_htf/(n*timestep)+m_col(t)*cp_htf+m_htf(t)*cp_htf+U_L*A_st(n)];

A(n,n-1:n)=u;

%B_matrix last element
B(1,n)=M_st*cp_htf/(n*timestep)*T_st(t-1,n)+m_htf(t)*cp_htf*T_htf_gen_out(t)+U_L*A_st(n)*T_amb(t);

X=A\B';


for i=1:n
    if X(i)>T_st_max
        m_col(t)=0;
        m_col_lost(t)=1;
    end
end
A=zeros(n,n);
B=zeros(1,n);
%A matrix coefficients (T_st(t,1), T_st(t,2))
v=[M_st*cp_htf/(n*timestep)+m_col(t)*cp_htf+m_htf(t)*cp_htf+U_L*A_st(1),-m_htf(t)*cp_htf];

A(1,1:2)=v;
%B_matrix first element
B(1,1)=M_st*cp_htf/(n*timestep)*T_st(t-1,1)+U_L*A_st(1)*T_amb(t)+m_col(t)*cp_htf*T_col_out(t);

%A,B matrix building 
for i=2:n-1
    w=[-m_col(t)*cp_htf,M_st*cp_htf/(n*timestep)+m_col(t)*cp_htf+m_htf(t)*cp_htf+U_L*A_st(i),-m_htf(t)*cp_htf];
    A(i,i-1:i+1)=w;
    B(1,i)=M_st*cp_htf/(n*timestep)*T_st(t-1,i)+U_L*A_st(i)*T_amb(t);
end

%A zone matrix coefficients last zone
u=[-m_col(t)*cp_htf,M_st*cp_htf/(n*timestep)+m_col(t)*cp_htf+m_htf(t)*cp_htf+U_L*A_st(n)];

A(n,n-1:n)=u;

%B_matrix last element
B(1,n)=M_st*cp_htf/(n*timestep)*T_st(t-1,n)+m_htf(t)*cp_htf*T_htf_gen_out(t)+U_L*A_st(n)*T_amb(t);

X=A\B';

for i=1:n
    T_st(t,i)=X(i);
    dQ_loss(t,i)=U_L*A_st(i)*(T_st(t,i)-T_amb(t));
end






