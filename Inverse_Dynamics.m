%% Formatting Script
close all;clc;clear all;

%% Dempster's Segmental Mass
total_mass = 84; % kg
foot_mass = 0.0145 * total_mass;
shank_mass = 0.0465 * total_mass;
thigh_mass = 0.1 * total_mass;
pelvis_mass = 0.1420 * total_mass;

%% Loading Static Data
static_data = load('Static_0001.mat');

labels = static_data.Alex_Static_0001.Trajectories.Labeled.Labels; % importing the labels into a list

timeseries_data = static_data.Alex_Static_0001.Trajectories.Labeled.Data; % extracting the 3D motion data

trajectory = struct(); % initializing the structure

% the static trial is 4 seconds, taking the average across the entire trial for each marker
for i = 1:length(labels)
    name = labels{i};
    trajectory.(name) = squeeze(timeseries_data(i,1:3,:));
    average.(name) = mean(trajectory.(name),2) / 1000;
end

%% Setting up Local Coordinate Systems

%plot markers
figure; hold on;
plot3(average.RASIS(1,1), average.RASIS(2,1), average.RASIS(3,1), 'ko', 'MarkerFaceColor', [1 1 0], 'DisplayName', 'RASIS');
plot3(average.LASIS(1,1), average.LASIS(2,1), average.LASIS(3,1), 'ko', 'MarkerFaceColor', [1 1 0], 'DisplayName', 'LASIS');
plot3(average.RPSIS(1,1), average.RPSIS(2,1), average.RPSIS(3,1), 'ko', 'MarkerFaceColor', [1 1 0], 'DisplayName', 'RPSIS');
plot3(average.LPSIS(1,1), average.LPSIS(2,1), average.LPSIS(3,1), 'ko', 'MarkerFaceColor', [1 1 0], 'DisplayName', 'LPSIS');
plot3(average.RT1(1,1), average.RT1(2,1), average.RT1(3,1), 'ko', 'MarkerFaceColor', [0 1 0], 'DisplayName', 'RT1');
plot3(average.RT2(1,1), average.RT2(2,1), average.RT2(3,1), 'ko', 'MarkerFaceColor', [0 1 0], 'DisplayName', 'RT2');
plot3(average.RT3(1,1), average.RT3(2,1), average.RT3(3,1), 'ko', 'MarkerFaceColor', [0 1 0], 'DisplayName', 'RT3');
plot3(average.RT4(1,1), average.RT4(2,1), average.RT4(3,1), 'ko', 'MarkerFaceColor', [0 1 0], 'DisplayName', 'RT4');
plot3(average.RLKE(1,1), average.RLKE(2,1), average.RLKE(3,1), 'ko', 'MarkerFaceColor', [1 0 0], 'DisplayName', 'RLKE');
plot3(average.RMKE(1,1), average.RMKE(2,1), average.RMKE(3,1), 'ko', 'MarkerFaceColor', [1 0 0], 'DisplayName', 'RMKE');
plot3(average.RS1(1,1), average.RS1(2,1), average.RS1(3,1), 'ko', 'MarkerFaceColor', [0 1 1], 'DisplayName', 'RS1');
plot3(average.RS2(1,1), average.RS2(2,1), average.RS2(3,1), 'ko', 'MarkerFaceColor', [0 1 1], 'DisplayName', 'RS2');
plot3(average.RS3(1,1), average.RS3(2,1), average.RS3(3,1), 'ko', 'MarkerFaceColor', [0 1 1], 'DisplayName', 'RS3');
plot3(average.RS4(1,1), average.RS4(2,1), average.RS4(3,1), 'ko', 'MarkerFaceColor', [0 1 1], 'DisplayName', 'RS4');
plot3(average.RLA(1,1), average.RLA(2,1), average.RLA(3,1), 'ko', 'MarkerFaceColor', [1 1 1], 'DisplayName', 'RLA');
plot3(average.RMA(1,1), average.RMA(2,1), average.RMA(3,1), 'ko', 'MarkerFaceColor', [1 1 1], 'DisplayName', 'RMA');
plot3(average.RHEEL(1,1), average.RHEEL(2,1), average.RHEEL(3,1), 'ko', 'MarkerFaceColor', [1 1 1], 'DisplayName', 'RHEEL');
plot3(average.RMH5(1,1), average.RMH5(2,1), average.RMH5(3,1), 'ko', 'MarkerFaceColor', [1 1 1], 'DisplayName', 'RMH5');
plot3(average.RMH1(1,1), average.RMH1(2,1), average.RMH1(3,1), 'ko', 'MarkerFaceColor', [1 1 1], 'DisplayName', 'RMH1');
plot3(average.RTOE(1,1), average.RTOE(2,1), average.RTOE(3,1), 'ko', 'MarkerFaceColor', [1 1 1], 'DisplayName', 'RTOE');
plot3(average.LT1(1,1), average.LT1(2,1), average.LT1(3,1), 'ko', 'MarkerFaceColor', [0 1 0], 'DisplayName', 'LT1');
plot3(average.LT2(1,1), average.LT2(2,1), average.LT2(3,1), 'ko', 'MarkerFaceColor', [0 1 0], 'DisplayName', 'LT2');
plot3(average.LT3(1,1), average.LT3(2,1), average.LT3(3,1), 'ko', 'MarkerFaceColor', [0 1 0], 'DisplayName', 'LT3');
plot3(average.LT4(1,1), average.LT4(2,1), average.LT4(3,1), 'ko', 'MarkerFaceColor', [0 1 0], 'DisplayName', 'LT4');
plot3(average.LLKE(1,1), average.LLKE(2,1), average.LLKE(3,1), 'ko', 'MarkerFaceColor', [1 0 0], 'DisplayName', 'LLKE');
plot3(average.LMKE(1,1), average.LMKE(2,1), average.LMKE(3,1), 'ko', 'MarkerFaceColor', [1 0 0], 'DisplayName', 'LMKE');
plot3(average.LS1(1,1), average.LS1(2,1), average.LS1(3,1), 'ko', 'MarkerFaceColor', [0 1 1], 'DisplayName', 'LS1');
plot3(average.LS2(1,1), average.LS2(2,1), average.LS2(3,1), 'ko', 'MarkerFaceColor', [0 1 1], 'DisplayName', 'LS2');
plot3(average.LS3(1,1), average.LS3(2,1), average.LS3(3,1), 'ko', 'MarkerFaceColor', [0 1 1], 'DisplayName', 'LS3');
plot3(average.LS4(1,1), average.LS4(2,1), average.LS4(3,1), 'ko', 'MarkerFaceColor', [0 1 1], 'DisplayName', 'LS4');
plot3(average.LLA(1,1), average.LLA(2,1), average.LLA(3,1), 'ko', 'MarkerFaceColor', [1 1 1], 'DisplayName', 'LLA');
plot3(average.LMA(1,1), average.LMA(2,1), average.LMA(3,1), 'ko', 'MarkerFaceColor', [1 1 1], 'DisplayName', 'LMA');
plot3(average.LHEEL(1,1), average.LHEEL(2,1), average.LHEEL(3,1), 'ko', 'MarkerFaceColor', [1 1 1], 'DisplayName', 'LHEEL');
plot3(average.LMH5(1,1), average.LMH5(2,1), average.LMH5(3,1), 'ko', 'MarkerFaceColor', [1 1 1], 'DisplayName', 'LMH5');
plot3(average.LMH1(1,1), average.LMH1(2,1), average.LMH1(3,1), 'ko', 'MarkerFaceColor', [1 1 1], 'DisplayName', 'LMH1');
plot3(average.LTOE(1,1), average.LTOE(2,1), average.LTOE(3,1), 'ko', 'MarkerFaceColor', [1 1 1], 'DisplayName', 'LTOE');

%Pelvis LCS
o_pelvis_static = 0.5*(average.RASIS + average.LASIS);
i_pelvis_static = (average.RASIS - o_pelvis_static) / (norm(average.RASIS - o_pelvis_static));
temp_pelvis_static = (o_pelvis_static - 0.5*(average.RPSIS + average.LPSIS)) / norm(o_pelvis_static - 0.5*(average.RPSIS + average.LPSIS));
k_pelvis_static = cross(i_pelvis_static, temp_pelvis_static) / norm(cross(i_pelvis_static, temp_pelvis_static));
j_pelvis_static = cross(k_pelvis_static, i_pelvis_static) / norm(cross(k_pelvis_static, i_pelvis_static));

pelvis_rotmax_static = [i_pelvis_static j_pelvis_static k_pelvis_static];
pelvis_lcs_static = [i_pelvis_static j_pelvis_static k_pelvis_static o_pelvis_static];
pelvis_lcs_static = [pelvis_lcs_static; 0 0 0 1];

%RThigh LCS
p_rhip_static = [0.36*norm(average.RASIS - average.LASIS); -0.19*norm(average.RASIS - average.LASIS); -0.30*norm(average.RASIS - average.LASIS)];
o_rthigh_static = pelvis_rotmax_static * p_rhip_static + o_pelvis_static;
k_rthigh_static = (o_rthigh_static - 0.5*(average.RLKE + average.RMKE)) / norm(o_rthigh_static - 0.5*(average.RLKE + average.RMKE));
temp_rthigh_static = (average.RLKE - average.RMKE) / norm(average.RLKE - average.RMKE);
j_rthigh_static = cross(k_rthigh_static, temp_rthigh_static) / norm(cross(k_rthigh_static, temp_rthigh_static) );
i_rthigh_static = cross(j_rthigh_static, k_rthigh_static) / norm(cross(j_rthigh_static, k_rthigh_static));

rthigh_lcs_static = [i_rthigh_static j_rthigh_static k_rthigh_static o_rthigh_static];
rthigh_lcs_static = [rthigh_lcs_static; 0 0 0 1];

%LThigh LCS
p_lhip_static = [-0.36*norm(average.RASIS - average.LASIS); -0.19*norm(average.RASIS - average.LASIS); -0.30*norm(average.RASIS - average.LASIS)];
o_lthigh_static = pelvis_rotmax_static * p_lhip_static + o_pelvis_static;
k_lthigh_static = (o_lthigh_static - 0.5*(average.LLKE + average.LMKE)) / norm(o_lthigh_static - 0.5*(average.LLKE + average.LMKE));
temp_lthigh_static = (average.LMKE - average.LLKE) / norm(average.LMKE - average.LLKE);
j_lthigh_static = cross(k_lthigh_static, temp_lthigh_static) / norm(cross(k_lthigh_static, temp_lthigh_static));
i_lthigh_static = cross(j_lthigh_static, k_lthigh_static) / norm(cross(j_lthigh_static, k_lthigh_static));

lthigh_lcs_static = [i_lthigh_static j_lthigh_static k_lthigh_static o_lthigh_static];
lthigh_lcs_static = [lthigh_lcs_static; 0 0 0 1];

%RShank LCS
o_rshank_static = 0.5 * (average.RLKE + average.RMKE);
k_rshank_static = (o_rshank_static - 0.5*(average.RLA + average.RMA)) / norm(o_rshank_static - 0.5*(average.RLA + average.RMA));
temp_rshank_static = (average.RLKE - average.RMKE) / norm(average.RLKE - average.RMKE);
j_rshank_static = cross(k_rshank_static, temp_rshank_static) / norm(cross(k_rshank_static, temp_rshank_static));
i_rshank_static = cross(j_rshank_static, k_rshank_static) / norm(cross(j_rshank_static, k_rshank_static));

rshank_lcs_static = [i_rshank_static j_rshank_static k_rshank_static o_rshank_static];
rshank_lcs_static = [rshank_lcs_static; 0 0 0 1];

%LShank LCS
o_lshank_static = 0.5 * (average.LLKE + average.LMKE);
k_lshank_static = (o_lshank_static - 0.5*(average.LLA + average.LMA)) / norm(o_lshank_static - 0.5*(average.LLA + average.LMA));
temp_lshank_static = (average.LMKE - average.LLKE) / norm(average.LMKE - average.LLKE);
j_lshank_static = cross(k_lshank_static, temp_lshank_static) / norm(cross(k_lshank_static, temp_lshank_static));
i_lshank_static = cross(j_lshank_static, k_lshank_static) / norm(cross(j_lshank_static, k_lshank_static));

lshank_lcs_static = [i_lshank_static j_lshank_static k_lshank_static o_lshank_static];
lshank_lcs_static = [lshank_lcs_static; 0 0 0 1];

%RFoot LCS
o_rfoot_static = 0.5 * (average.RLA + average.RMA);
i_rfoot_static = (average.RLA - o_rfoot_static) / norm(average.RLA - o_rfoot_static);
temp_rfoot_static = (0.5 * (average.RMH5 + average.RMH1) - o_rfoot_static) / norm(0.5 * (average.RMH5 + average.RMH1) - o_rfoot_static);
k_rfoot_static = cross(i_rfoot_static, temp_rfoot_static) / norm(cross(i_rfoot_static, temp_rfoot_static));
j_rfoot_static = cross(k_rfoot_static, i_rfoot_static) / norm(cross(k_rfoot_static, i_rfoot_static));

rfoot_lcs_static = [i_rfoot_static j_rfoot_static k_rfoot_static o_rfoot_static];
rfoot_lcs_static = [rfoot_lcs_static; 0 0 0 1];

%LFoot LCS
o_lfoot_static = 0.5 * (average.LLA + average.LMA);
i_lfoot_static = (average.LMA - o_lfoot_static) / norm((average.LMA - o_lfoot_static));
temp_lfoot_static = (0.5 * (average.LMH5 + average.LMH1) - o_lfoot_static) / norm(0.5 * (average.LMH5 + average.LMH1) - o_lfoot_static);
k_lfoot_static = cross(i_lfoot_static, temp_lfoot_static) / norm(cross(i_lfoot_static, temp_lfoot_static));
j_lfoot_static = cross(k_lfoot_static, i_lfoot_static) / norm(cross(k_lfoot_static, i_lfoot_static));

lfoot_lcs_static = [i_lfoot_static j_lfoot_static k_lfoot_static o_lfoot_static];
lfoot_lcs_static = [lfoot_lcs_static; 0 0 0 1];

%Right Marker Cluster Thigh LCS
o_rmct_static = average.RT3;
j_rmct_static = (average.RT4 - average.RT3) / norm(average.RT4 - average.RT3);
temp_rmct_static = (average.RT2 - average.RT3) / norm(average.RT2 - average.RT3);
i_rmct_static = cross(j_rmct_static, temp_rmct_static) / norm(cross(j_rmct_static, temp_rmct_static));
k_rmct_static = cross(i_rmct_static, j_rmct_static) / norm(cross(i_rmct_static, j_rmct_static));

rmct_lcs_static = [i_rmct_static j_rmct_static k_rmct_static o_rmct_static];
rmct_lcs_static = [rmct_lcs_static; 0 0 0 1];

%Left Marker Cluster Thigh LCS
o_lmct_static = average.LT3;
j_lmct_static = (average.LT4 - average.LT3) / norm(average.LT4 - average.LT3);
temp_lmct_static = (average.LT2 - average.LT3) / norm(average.LT2 - average.LT3);
i_lmct_static = cross(j_lmct_static, temp_lmct_static) / norm(cross(j_lmct_static, temp_lmct_static));
k_lmct_static = cross(i_lmct_static, j_lmct_static) / norm(cross(i_lmct_static, j_lmct_static));

lmct_lcs_static = [i_lmct_static j_lmct_static k_lmct_static o_lmct_static];
lmct_lcs_static = [lmct_lcs_static; 0 0 0 1];

%Right Marker Cluster Shank LCS
o_rmcs_static = average.RS3;
j_rmcs_static = (average.RS4 - average.RS3) / norm(average.RS4 - average.RS3);
temp_rmcs_static = (average.RS2 - average.RS3) / norm(average.RS2 - average.RS3);
i_rmcs_static = cross(j_rmcs_static, temp_rmcs_static) / norm(cross(j_rmcs_static, temp_rmcs_static));
k_rmcs_static = cross(i_rmcs_static, j_rmcs_static) / norm(cross(i_rmcs_static, j_rmcs_static));

rmcs_lcs_static = [i_rmcs_static j_rmcs_static k_rmcs_static o_rmcs_static];
rmcs_lcs_static = [rmcs_lcs_static; 0 0 0 1];

%Left Marker Cluster Shank LCS
o_lmcs_static = average.LS3;
j_lmcs_static = (average.LS4 - average.LS3) / norm(average.LS4 - average.LS3);
temp_lmcs_static = (average.LS2 - average.LS3) / norm(average.LS2 - average.LS3);
i_lmcs_static = cross(j_lmcs_static, temp_lmcs_static) / norm(cross(j_lmcs_static, temp_lmcs_static));
k_lmcs_static = cross(i_lmcs_static, j_lmcs_static) / norm(cross(i_lmcs_static, j_lmcs_static));

lmcs_lcs_static = [i_lmcs_static j_lmcs_static k_lmcs_static o_lmcs_static];
lmcs_lcs_static = [lmcs_lcs_static; 0 0 0 1];

%Right Marker Cluster Foot LCS
o_rmcf_static = average.RHEEL;
j_rmcf_static = (average.RTOE - o_rmcf_static)/norm(average.RTOE - o_rmcf_static);
temp_rmcf_static = (average.RMH1 - o_rmcf_static) / norm(average.RMH1 - o_rmcf_static);
k_rmcf_static = cross(j_rmcf_static, temp_rmcf_static) / norm(cross(j_rmcf_static, temp_rmcf_static));
i_rmcf_static = cross(j_rmcf_static, k_rmcf_static) / norm(cross(j_rmcf_static, k_rmcf_static));

rmcf_lcs_static = [i_rmcf_static j_rmcf_static k_rmcf_static o_rmcf_static];
rmcf_lcs_static = [rmcf_lcs_static; 0 0 0 1];

%Left Marker Cluster Foot LCS
o_lmcf_static = average.LHEEL;
j_lmcf_static = (average.LTOE - o_lmcf_static)/norm(average.LTOE - o_lmcf_static);
temp_lmcf_static = (average.LMH1 - o_lmcf_static) / norm(average.LMH1 - o_lmcf_static);
k_lmcf_static = cross(temp_lmcf_static, j_lmcf_static) / norm(cross(temp_lmcf_static, j_lmcf_static));
i_lmcf_static = cross(j_lmcf_static, k_lmcf_static) / norm(cross(j_lmcf_static, k_lmcf_static));

lmcf_lcs_static = [i_lmcf_static j_lmcf_static k_lmcf_static o_lmcf_static];
lmcf_lcs_static = [lmcf_lcs_static; 0 0 0 1];


%Plot Local Coordinate Systems
plotLCS(pelvis_lcs_static);
plotLCS(rthigh_lcs_static);
plotLCS(lthigh_lcs_static);
plotLCS(rshank_lcs_static);
plotLCS(lshank_lcs_static);
plotLCS(rfoot_lcs_static);
plotLCS(lfoot_lcs_static);
plotLCS(rmct_lcs_static);
plotLCS(lmct_lcs_static);
plotLCS(rmcs_lcs_static);
plotLCS(lmcs_lcs_static);
plotLCS(rmcf_lcs_static);
plotLCS(lmcf_lcs_static);

%Plotting
axis equal

%Label Axis
xlabel('X [m]')
ylabel('Y [m]')
zlabel('Z [m]')

%% Anatomical to Marker Cluster Relationships

%Thigh LCS relative to thigh marker cluster LCS
rth_rel_mct = rmct_lcs_static^-1 * rthigh_lcs_static;
lth_rel_mct = lmct_lcs_static^-1 * lthigh_lcs_static;

%Shank LCS relative to shank marker cluster LCS
rsh_rel_mcs = rmcs_lcs_static^-1 * rshank_lcs_static;
lsh_rel_mcs = lmcs_lcs_static^-1 * lshank_lcs_static;

%Foot LCS relative to foot marker cluster LCS
rft_rel_mcf = rmcf_lcs_static^-1 * rfoot_lcs_static;
lft_rel_mcf = lmcf_lcs_static^-1 * lfoot_lcs_static;

%% Moments of Inertia and Segment COM

% Right Thigh
[rthigh_Ixx, rthigh_Iyy, rthigh_Izz, rthigh_com, rthigh_I] = frustum_inertia( ...
    0.5*norm(average.RLKE - average.RMKE), ...                % distal radius
    0.5*norm(p_rhip_static - p_lhip_static), ...              % proximal radius
    norm(o_rthigh_static - o_rshank_static), ...              % length
    thigh_mass);

% Right Shank
[rshank_Ixx, rshank_Iyy, rshank_Izz, rshank_com, rshank_I] = frustum_inertia( ...
    0.5*norm(average.RLA - average.RMA), ...                    % distal radius
    0.5*norm(average.RLKE - average.RMKE), ...                  % proximal radius
    norm(o_rshank_static - o_rfoot_static), ...                 % length
    shank_mass);

% Left Thigh
[lthigh_Ixx, lthigh_Iyy, lthigh_Izz, lthigh_com, lthigh_I] = frustum_inertia( ...
    0.5*norm(average.LLKE - average.LMKE), ...                % distal radius
    0.5*norm(p_lhip_static - p_rhip_static), ...              % proximal radius
    norm(o_lthigh_static - o_lshank_static), ...              % length
    thigh_mass);

% Left Shank
[lshank_Ixx, lshank_Iyy, lshank_Izz, lshank_com, lshank_I] = frustum_inertia( ...
    0.5*norm(average.LLA - average.LMA), ...                    % distal radius
    0.5*norm(average.LLKE - average.LMKE), ...                  % proximal radius
    norm(o_lshank_static - o_lfoot_static), ...                 % length
    shank_mass);

% Right Foot
[rfoot_Ixx, rfoot_Iyy, rfoot_Izz, rfoot_com, rfoot_I] = frustum_inertia( ...
    0.5*norm(average.RMH1 - average.RMH5), ...            % distal radius (toe)
    0.5*norm(average.RLA - average.RMA), ...              % proximal radius (ankle)
    norm(o_rfoot_static - average.RTOE), ...              % length
    foot_mass);

% Left Foot
[lfoot_Ixx, lfoot_Iyy, lfoot_Izz, lfoot_com, lfoot_I] = frustum_inertia( ...
    0.5*norm(average.LMH1 - average.LMH5), ...            % distal radius (toe)
    0.5*norm(average.LLA - average.LMA), ...              % proximal radius (ankle)
    norm(o_lfoot_static - average.LTOE), ...              % length
    foot_mass);

% Pelvis
[pelvis_Ixx, pelvis_Iyy, pelvis_Izz, pelvis_com, pelvis_I] = cylinder_inertia( ...
    0.5*norm(average.RASIS - average.LASIS), ...                                                % R (medial/lateral radius)
    0.5*norm(((average.RPSIS + average.LPSIS)/2) - ((average.RASIS + average.LASIS)/2)), ...    % D (anterior/posterior depth)
    0.5*norm(average.RASIS - average.LASIS), ...                                                % L (length/height) (the radius is equal to the length)
    pelvis_mass);

%% Loading Walking Data
walking_data = load('Walk_0001.mat');

labels = walking_data.Alex_Walk_0001.Trajectories.Labeled.Labels;

timeseries_data = walking_data.Alex_Walk_0001.Trajectories.Labeled.Data;

trajectory = struct();

% filter parameters
fs_kin = 200;
fc_kin = 15;
[b_kin, a_kin] = butter(4, fc_kin/(fs_kin/2));

for i = 1:length(labels)
    name = labels{i};
    raw = squeeze(timeseries_data(i,1:3,:)) / 1000;  % 3 x N
    
    %raw(isnan(raw)) = 0;
    for dim = 1:3
        row = raw(dim, :);
        nan_idx = isnan(row);
        if any(nan_idx)
            t = 1:length(row);
            row(nan_idx) = interp1(t(~nan_idx), row(~nan_idx), t(nan_idx), 'linear', 'extrap');
            raw(dim, :) = row;
        end
    end


    % --- Filter ---
    filtered = filtfilt(b_kin, a_kin, raw')';
    
    trajectory.(name) = filtered;
end

% %% Loading Walking Data
% walking_data = load('Alex_Walk_0001.mat');
% 
% labels = walking_data.Alex_Walk_0001.Trajectories.Labeled.Labels;
% 
% timeseries_data = walking_data.Alex_Walk_0001.Trajectories.Labeled.Data;
% 
% trajectory = struct();
% 
% for i = 1:length(labels)
%     name = labels{i};
%     trajectory.(name) = squeeze(timeseries_data(i,1:3,:)) / 1000;
% end

%% Linear Kinematics

numCols = walking_data.Alex_Walk_0001.Frames;

Framerate = walking_data.Alex_Walk_0001.FrameRate;

dt = 1/Framerate;

time = numCols/Framerate;
time = linspace(0,time,numCols);

% Initialize center of mass arrays
pelvis_com_pos = zeros(3, numCols);
rthigh_com_pos = zeros(3, numCols);
lthigh_com_pos = zeros(3, numCols);
rshank_com_pos = zeros(3, numCols);
lshank_com_pos = zeros(3, numCols);
rfoot_com_pos = zeros(3, numCols);
lfoot_com_pos = zeros(3, numCols);

% Initialize global origins
rankle_center_global = zeros(3, numCols);
lankle_center_global = zeros(3, numCols);
rknee_center_global = zeros(3, numCols);

for i = 1:numCols
    %Pelvis LCS
    o_pelvis = 0.5*(trajectory.RASIS(:,i) + trajectory.LASIS(:,i));
    i_pelvis = (trajectory.RASIS(:,i) - o_pelvis) / (norm(trajectory.RASIS(:,i) - o_pelvis));
    temp_pelvis = (o_pelvis - 0.5*(trajectory.RPSIS(:,i) + trajectory.LPSIS(:,i))) / norm(o_pelvis - 0.5*(trajectory.RPSIS(:,i) + trajectory.LPSIS(:,i)));
    k_pelvis = cross(i_pelvis, temp_pelvis) / norm(cross(i_pelvis, temp_pelvis));
    j_pelvis = cross(k_pelvis, i_pelvis) / norm(cross(k_pelvis, i_pelvis));
    
    pelvis_rotmax = [i_pelvis j_pelvis k_pelvis];
    pelvis_com_pos(:,i) = pelvis_rotmax * pelvis_com + o_pelvis;
    
    %RThigh LCS
    p_hip = [0.36*norm(trajectory.RASIS(:,i) - trajectory.LASIS(:,i)); -0.19*norm(trajectory.RASIS(:,i) - trajectory.LASIS(:,i)); -0.30*norm(trajectory.RASIS(:,i) - trajectory.LASIS(:,i))];
    o_rthigh = pelvis_rotmax * p_hip + o_pelvis;
    k_rthigh = (o_rthigh - 0.5*(trajectory.RLKE(:,i) + trajectory.RMKE(:,i))) / norm(o_rthigh - 0.5*(trajectory.RLKE(:,i) + trajectory.RMKE(:,i)));
    temp_rthigh = (trajectory.RLKE(:,i) - trajectory.RMKE(:,i)) / norm(trajectory.RLKE(:,i) - trajectory.RMKE(:,i));
    j_rthigh = cross(k_rthigh, temp_rthigh) / norm(cross(k_rthigh, temp_rthigh));
    i_rthigh = cross(j_rthigh, k_rthigh) / norm(cross(j_rthigh, k_rthigh));
    
    rthigh_rotmax = [i_rthigh j_rthigh k_rthigh];
    rthigh_com_pos(:,i) = rthigh_rotmax * rthigh_com + o_rthigh;

    %LThigh LCS
    p_hip = [-0.36*norm(trajectory.RASIS(:,i) - trajectory.LASIS(:,i)); -0.19*norm(trajectory.RASIS(:,i) - trajectory.LASIS(:,i)); -0.30*norm(trajectory.RASIS(:,i) - trajectory.LASIS(:,i))];
    o_lthigh = pelvis_rotmax * p_hip + o_pelvis;
    k_lthigh = (o_lthigh - 0.5*(trajectory.LLKE(:,i) + trajectory.LMKE(:,i))) / norm(o_lthigh - 0.5*(trajectory.LLKE(:,i) + trajectory.LMKE(:,i)));
    temp_lthigh = (trajectory.LMKE(:,i) - trajectory.LLKE(:,i)) / norm(trajectory.LMKE(:,i) - trajectory.LLKE(:,i));
    j_lthigh = cross(k_lthigh, temp_lthigh) / norm(cross(k_lthigh, temp_lthigh));
    i_lthigh = cross(j_lthigh, k_lthigh) / norm(cross(j_lthigh, k_lthigh));
    
    lthigh_rotmax = [i_lthigh j_lthigh k_lthigh];
    lthigh_com_pos(:,i) = lthigh_rotmax * lthigh_com + o_lthigh;

    %RShank LCS
    o_rshank = 0.5 * (trajectory.RLKE(:,i) + trajectory.RMKE(:,i));
    rknee_center_global(:,i) = o_rshank;
    k_rshank = (o_rshank - 0.5*(trajectory.RLA(:,i) + trajectory.RMA(:,i))) / norm(o_rshank - 0.5*(trajectory.RLA(:,i) + trajectory.RMA(:,i)));
    temp_rshank = (trajectory.RLKE(:,i) - trajectory.RMKE(:,i)) / norm(trajectory.RLKE(:,i) - trajectory.RMKE(:,i));
    j_rshank = cross(k_rshank, temp_rshank) / norm(cross(k_rshank, temp_rshank));
    i_rshank = cross(j_rshank, k_rshank) / norm(cross(j_rshank, k_rshank));
    
    rshank_rotmax = [i_rshank j_rshank k_rshank];
    rshank_com_pos(:,i) = rshank_rotmax * rshank_com + o_rshank;
    
    %LShank LCS
    o_lshank = 0.5 * (trajectory.LLKE(:,i) + trajectory.LMKE(:,i));
    k_lshank = (o_lshank - 0.5*(trajectory.LLA(:,i) + trajectory.LMA(:,i))) / norm(o_lshank - 0.5*(trajectory.LLA(:,i) + trajectory.LMA(:,i)));
    temp_lshank = (trajectory.LMKE(:,i) - trajectory.LLKE(:,i)) / norm(trajectory.LMKE(:,i) - trajectory.LLKE(:,i));
    j_lshank = cross(k_lshank, temp_lshank) / norm(cross(k_lshank, temp_lshank));
    i_lshank = cross(j_lshank, k_lshank) / norm(cross(j_lshank, k_lshank));
    
    lshank_rotmax = [i_lshank j_lshank k_lshank];
    lshank_com_pos(:,i) = lshank_rotmax * lshank_com + o_lshank;

    %RFoot LCS Kinetics
    o_rfoot = 0.5 * (trajectory.RLA(:,i) + trajectory.RMA(:,i));
    rankle_center_global(:,i) = o_rfoot;
    k_rfoot = (o_rfoot - 0.5 * (trajectory.RMH5(:,i) + trajectory.RMH1(:,i))) / norm(o_rfoot - 0.5 * (trajectory.RMH5(:,i) + trajectory.RMH1(:,i)));
    temp_rfoot = (trajectory.RLA(:,i) - trajectory.RMA(:,i)) / norm(trajectory.RLA(:,i) - trajectory.RMA(:,i));
    j_rfoot = cross(k_rfoot, temp_rfoot) / norm(cross(k_rfoot, temp_rfoot) );
    i_rfoot = cross(j_rfoot, k_rfoot) / norm(cross(j_rfoot, k_rfoot));
    
    rft_rotmax = [i_rfoot j_rfoot k_rfoot];
    rfoot_com_pos(:,i) = rft_rotmax * rfoot_com + o_rfoot;
    
    %LFoot LCS Kinetics
    o_lfoot = 0.5 * (trajectory.LLA(:,i) + trajectory.LMA(:,i));
    lankle_center_global(:,i) = o_lfoot;
    k_lfoot = (o_lfoot - 0.5 * (trajectory.LMH5(:,i) + trajectory.LMH1(:,i))) / norm(o_lfoot - 0.5 * (trajectory.LMH5(:,i) + trajectory.LMH1(:,i)));
    temp_lfoot = (trajectory.LMA(:,i) - trajectory.LLA(:,i)) / norm(trajectory.LMA(:,i) - trajectory.LLA(:,i));
    j_lfoot = cross(k_lfoot, temp_lfoot) / norm(cross(k_lfoot, temp_lfoot));
    i_lfoot = cross(j_lfoot, k_lfoot) / norm(cross(j_lfoot, k_lfoot));
    
    lfoot_rotmax = [i_lfoot j_lfoot k_lfoot];
    lfoot_com_pos(:,i) = lfoot_rotmax * lfoot_com + o_lfoot;

end

pelvis_com_vel = compute_vel(pelvis_com_pos, dt);
pelvis_com_acc = compute_acc(pelvis_com_pos, dt);
rthigh_com_vel = compute_vel(rthigh_com_pos, dt);
rthigh_com_acc = compute_acc(rthigh_com_pos, dt);
lthigh_com_vel = compute_vel(lthigh_com_pos, dt);
lthigh_com_acc = compute_acc(lthigh_com_pos, dt);
rshank_com_vel = compute_vel(rshank_com_pos, dt);
rshank_com_acc = compute_acc(rshank_com_pos, dt);
lshank_com_vel = compute_vel(lshank_com_pos, dt);
lshank_com_acc = compute_acc(lshank_com_pos, dt);
rfoot_com_vel = compute_vel(rfoot_com_pos, dt);
rfoot_com_acc = compute_acc(rfoot_com_pos, dt);
lfoot_com_vel = compute_vel(lfoot_com_pos, dt);
lfoot_com_acc = compute_acc(lfoot_com_pos, dt);

% plot_kinematics(time, rshank_com_pos);
% plot_kinematics(time, rshank_com_vel);
% plot_kinematics(time, rshank_com_acc);

%% Angular Kinematics

% storing the rotation matrices and joint angles
R_hip = zeros(3,3,numCols);
R_knee = zeros(3,3,numCols);
R_ankle = zeros(3,3,numCols);
rhip_joint_angles   = zeros(numCols,3);
rknee_joint_angles  = zeros(numCols,3);
rankle_joint_angles = zeros(numCols,3);

L_hip = zeros(3,3,numCols);
L_knee = zeros(3,3,numCols);
L_ankle = zeros(3,3,numCols);
lhip_joint_angles   = zeros(numCols,3);
lknee_joint_angles  = zeros(numCols,3);
lankle_joint_angles = zeros(numCols,3);

% segment velocity
R_foot = zeros(3,3,numCols);
R_shank = zeros(3,3,numCols);
R_thigh = zeros(3,3,numCols);
L_foot = zeros(3,3,numCols);
L_shank = zeros(3,3,numCols);
L_thigh = zeros(3,3,numCols);

% right limb
for i = 1:numCols
    %Pelvis LCS
    o_pelvis = 0.5*(trajectory.RASIS(:,i) + trajectory.LASIS(:,i));
    i_pelvis = (trajectory.RASIS(:,i) - o_pelvis)/(norm(trajectory.RASIS(:,i) - o_pelvis));
    temp_pelvis = (o_pelvis - 0.5*(trajectory.RPSIS(:,i) + trajectory.LPSIS(:,i))) / norm(o_pelvis - 0.5*(trajectory.RPSIS(:,i) + trajectory.LPSIS(:,i)));
    k_pelvis = cross(i_pelvis, temp_pelvis) / norm(cross(i_pelvis, temp_pelvis));
    j_pelvis = cross(k_pelvis, i_pelvis) / norm(cross(k_pelvis, i_pelvis));
    
    pelvis_rotmax = [i_pelvis j_pelvis k_pelvis];
    pelvis_lcs = [i_pelvis j_pelvis k_pelvis o_pelvis];
    pelvis_lcs = [pelvis_lcs; 0 0 0 1];
    
    %Right Marker Cluster Thigh LCS
    o_rmct = trajectory.RT3(:,i);
    j_rmct = (trajectory.RT4(:,i) - trajectory.RT3(:,i)) / norm(trajectory.RT4(:,i) - trajectory.RT3(:,i));
    temp_rmct = (trajectory.RT2(:,i) - trajectory.RT3(:,i)) / norm(trajectory.RT2(:,i) - trajectory.RT3(:,i));
    i_rmct = cross(j_rmct, temp_rmct) / norm(cross(j_rmct, temp_rmct));
    k_rmct = cross(i_rmct, j_rmct) / norm(cross(i_rmct, j_rmct));
    
    rmct_lcs_mov = [i_rmct j_rmct k_rmct o_rmct];
    rmct_lcs_mov = [rmct_lcs_mov; 0 0 0 1];

    R_thigh(:,:,i) = rmct_lcs_mov(1:3, 1:3);

    anat_rth_gcs = rmct_lcs_mov * rth_rel_mct;

    rhip = pelvis_lcs^-1 * anat_rth_gcs;

    %extract the rotation matrix
    R = rhip(1:3, 1:3);

    %transposing matrix
    R = R';

    R_hip(:,:,i) = R';

    %extract the euler angles in XYZ form
    alpha = atan2d(-R(3,2),R(3,3));
    beta = atan2d(R(3,1),(sqrt((R(1,1)^2 + R(2,1)^2))));
    gamma = atan2d(-R(2,1),R(1,1));

    rhip_joint_angles(i, :) = [alpha, beta, gamma];

    
    %Right Marker Cluster Shank LCS
    o_rmcs = trajectory.RS3(:,i);
    j_rmcs = (trajectory.RS4(:,i) - trajectory.RS3(:,i)) / norm(trajectory.RS4(:,i) - trajectory.RS3(:,i));
    temp_rmcs = (trajectory.RS2(:,i) - trajectory.RS3(:,i)) / norm(trajectory.RS2(:,i) - trajectory.RS3(:,i));
    i_rmcs = cross(j_rmcs, temp_rmcs) / norm(cross(j_rmcs, temp_rmcs));
    k_rmcs = cross(i_rmcs, j_rmcs) / norm(cross(i_rmcs, j_rmcs));
    
    rmcs_lcs_mov = [i_rmcs j_rmcs k_rmcs o_rmcs];
    rmcs_lcs_mov = [rmcs_lcs_mov; 0 0 0 1];
    
    R_shank(:,:,i) = rmcs_lcs_mov(1:3, 1:3);

    anat_rsh_gcs = rmcs_lcs_mov * rsh_rel_mcs;

    %Shank relative to thigh
    rknee_angle = anat_rth_gcs^-1 * anat_rsh_gcs;

    %extract the rotation matrix
    R = rknee_angle(1:3, 1:3);
    
    %transposing matrix
    R = R';

    R_knee(:, :, i) = R;

    %extract the euler angles in XYZ form
    alpha = atan2d(-R(3,2),R(3,3));
    beta = atan2d(R(3,1),(sqrt((R(1,1)^2 + R(2,1)^2))));
    gamma = atan2d(-R(2,1),R(1,1));

    rknee_joint_angles(i, :) = [-alpha, -beta, -gamma];
    

    %Right Marker Cluster Foot LCS
    o_rmcf = trajectory.RHEEL(:,i);
    j_rmcf = (trajectory.RTOE(:,i) - o_rmcf)/norm(trajectory.RTOE(:,i) - o_rmcf);
    temp_rmcf = (trajectory.RMH1(:,i) - o_rmcf) / norm(trajectory.RMH1(:,i) - o_rmcf);
    k_rmcf = cross(j_rmcf, temp_rmcf) / norm(cross(j_rmcf, temp_rmcf));
    i_rmcf = cross(j_rmcf, k_rmcf) / norm(cross(j_rmcf, k_rmcf));
    
    rmcf_lcs_mov = [i_rmcf j_rmcf k_rmcf o_rmcf];
    rmcf_lcs_mov = [rmcf_lcs_mov; 0 0 0 1];

    R_foot(:,:,i) = rmcf_lcs_mov(1:3, 1:3);

    anat_rft_gcs = rmcf_lcs_mov * rft_rel_mcf;

    %Foot relative to shank
    rankle = anat_rsh_gcs^-1 * anat_rft_gcs;

    %extract the rotation matrix
    R = rankle(1:3, 1:3);

    R_ankle(:,:,i) = R;

    %extract the euler angles in XYZ form
    alpha = atan2d(-R(3,2),R(3,3));
    beta = atan2d(R(3,1),(sqrt((R(1,1)^2 + R(2,1)^2))));
    gamma = atan2d(-R(2,1),R(1,1));

    rankle_joint_angles(i, :) = [-alpha, -beta, -gamma];
end


% left limb
for i = 1:numCols
    %Pelvis LCS
    o_pelvis = 0.5*(trajectory.RASIS(:,i) + trajectory.LASIS(:,i));
    i_pelvis = (trajectory.RASIS(:,i) - o_pelvis)/(norm(trajectory.RASIS(:,i) - o_pelvis));
    temp_pelvis = (o_pelvis - 0.5*(trajectory.RPSIS(:,i) + trajectory.LPSIS(:,i))) / norm(o_pelvis - 0.5*(trajectory.RPSIS(:,i) + trajectory.LPSIS(:,i)));
    k_pelvis = cross(i_pelvis, temp_pelvis) / norm(cross(i_pelvis, temp_pelvis));
    j_pelvis = cross(k_pelvis, i_pelvis) / norm(cross(k_pelvis, i_pelvis));
    
    pelvis_rotmax = [i_pelvis j_pelvis k_pelvis];
    pelvis_lcs = [i_pelvis j_pelvis k_pelvis o_pelvis];
    pelvis_lcs = [pelvis_lcs; 0 0 0 1];

    %Left Marker Cluster Thigh LCS
    o_lmct = trajectory.LT3(:,i);
    j_lmct = (trajectory.LT4(:,i) - trajectory.LT3(:,i)) / norm(trajectory.LT4(:,i) - trajectory.LT3(:,i));
    temp_lmct = (trajectory.LT2(:,i) - trajectory.LT3(:,i)) / norm(trajectory.LT2(:,i) - trajectory.LT3(:,i));
    i_lmct = cross(j_lmct, temp_lmct) / norm(cross(j_lmct, temp_lmct));
    k_lmct = cross(i_lmct, j_lmct) / norm(cross(i_lmct, j_lmct));
    
    lmct_lcs_mov = [i_lmct j_lmct k_lmct o_lmct];
    lmct_lcs_mov = [lmct_lcs_mov; 0 0 0 1];

    L_thigh(:,:,i) = lmct_lcs_mov(1:3, 1:3);

    anat_lth_gcs = lmct_lcs_mov * lth_rel_mct;

    lhip = pelvis_lcs^-1 * anat_lth_gcs;

    R = lhip(1:3,1:3);
    R = R';

    L_hip(:,:,i) = R';

    alpha = atan2d(-R(3,2),R(3,3));
    beta  = atan2d(R(3,1),(sqrt((R(1,1)^2 + R(2,1)^2))));
    gamma = atan2d(-R(2,1),R(1,1));

    lhip_joint_angles(i,:) = [alpha, beta, gamma];


    %Left Marker Cluster Shank LCS
    o_lmcs = trajectory.LS3(:,i);
    j_lmcs = (trajectory.LS4(:,i) - trajectory.LS3(:,i)) / norm(trajectory.LS4(:,i) - trajectory.LS3(:,i));
    temp_lmcs = (trajectory.LS2(:,i) - trajectory.LS3(:,i)) / norm(trajectory.LS2(:,i) - trajectory.LS3(:,i));
    i_lmcs = cross(j_lmcs, temp_lmcs) / norm(cross(j_lmcs, temp_lmcs));
    k_lmcs = cross(i_lmcs, j_lmcs) / norm(cross(i_lmcs, j_lmcs));
    
    lmcs_lcs_mov = [i_lmcs j_lmcs k_lmcs o_lmcs];
    lmcs_lcs_mov = [lmcs_lcs_mov; 0 0 0 1];

    L_shank(:,:,i) = lmcs_lcs_mov(1:3, 1:3);

    anat_lsh_gcs = lmcs_lcs_mov * lsh_rel_mcs;

    % Shank relative to thigh
    lknee = anat_lth_gcs^-1 * anat_lsh_gcs;

    R = lknee(1:3,1:3);
    R = R';

    L_knee(:,:,i) = R;

    alpha = atan2d(-R(3,2),R(3,3));
    beta  = atan2d(R(3,1),(sqrt((R(1,1)^2 + R(2,1)^2))));
    gamma = atan2d(-R(2,1),R(1,1));

    lknee_joint_angles(i,:) = [-alpha, -beta, -gamma];


    %Left Marker Cluster Foot LCS
    o_lmcf = trajectory.LHEEL(:,i);
    j_lmcf = (trajectory.LTOE(:,i) - o_lmcf) / norm(trajectory.LTOE(:,i) - o_lmcf);
    temp_lmcf = (trajectory.LMH1(:,i) - o_lmcf) / norm(trajectory.LMH1(:,i) - o_lmcf);
    k_lmcf = cross(temp_lmcf, j_lmcf) / norm(cross(temp_lmcf, j_lmcf));
    i_lmcf = cross(j_lmcf, k_lmcf) / norm(cross(j_lmcf, k_lmcf));
    
    lmcf_lcs_mov = [i_lmcf j_lmcf k_lmcf o_lmcf];
    lmcf_lcs_mov = [lmcf_lcs_mov; 0 0 0 1];

    L_foot(:,:,i) = lmcf_lcs_mov(1:3, 1:3);

    anat_lft_gcs = lmcf_lcs_mov * lft_rel_mcf;

    % Foot relative to shank
    lankle = anat_lsh_gcs^-1 * anat_lft_gcs;

    R = lankle(1:3,1:3);

    L_ankle(:,:,i) = R;

    alpha = atan2d(-R(3,2),R(3,3));
    beta  = atan2d(R(3,1),(sqrt((R(1,1)^2 + R(2,1)^2))));
    gamma = atan2d(-R(2,1),R(1,1));

    lankle_joint_angles(i,:) = [-alpha, -beta, -gamma];
end

% plot_kinematics_ang(time, rhip_joint_angles);
plot_kinematics_ang(time, rknee_joint_angles);
% plot_kinematics_ang(time, rankle_joint_angles);
% plot_kinematics_ang(time, lhip_joint_angles);
% plot_kinematics_ang(time, lknee_joint_angles);
% plot_kinematics_ang(time, lankle_joint_angles);

%% Segment angular kinematics
rfoot_ang_vel = calculateRotMatAngularVelocity(R_foot,Framerate, 'rad');
rshank_ang_vel = calculateRotMatAngularVelocity(R_shank,Framerate, 'rad');
rthigh_ang_vel = calculateRotMatAngularVelocity(R_thigh,Framerate, 'rad');
lfoot_ang_vel = calculateRotMatAngularVelocity(L_foot,Framerate, 'rad');
lshank_ang_vel = calculateRotMatAngularVelocity(L_shank,Framerate, 'rad');
lthigh_ang_vel = calculateRotMatAngularVelocity(L_thigh,Framerate, 'rad');

rfoot_ang_acc = gradient(rfoot_ang_vel, dt);
rshank_ang_acc = gradient(rshank_ang_vel, dt);
rthigh_ang_acc = gradient(rthigh_ang_vel, dt);
lfoot_ang_acc = gradient(lfoot_ang_vel, dt);
lshank_ang_acc = gradient(lshank_ang_vel, dt);
lthigh_ang_acc = gradient(lthigh_ang_vel, dt);

% plot_kinematics(time, rfoot_ang_acc);
% plot_kinematics(time, rshank_ang_acc);
% plot_kinematics(time, rthigh_ang_vel);
% plot_kinematics(time, lfoot_ang_vel);
% plot_kinematics(time, lshank_ang_vel);
% plot_kinematics(time, lthigh_ang_vel);

%% Joint Angular Velocity

% Function to calculate rotational matrix angular velocity
rhip_ang_vel = calculateRotMatAngularVelocity(R_hip,Framerate, 'rad');
rknee_ang_vel = calculateRotMatAngularVelocity(R_knee,Framerate, 'rad');
rankle_ang_vel = calculateRotMatAngularVelocity(R_ankle,Framerate, 'rad');
lhip_ang_vel = calculateRotMatAngularVelocity(L_hip,Framerate, 'rad');
lknee_ang_vel = calculateRotMatAngularVelocity(L_knee,Framerate, 'rad');
lankle_ang_vel = calculateRotMatAngularVelocity(L_ankle,Framerate, 'rad');

%% Joint Angular Acceleration
rhip_ang_acc = gradient(rhip_ang_vel, dt);
rknee_ang_acc = gradient(rknee_ang_vel, dt);
rankle_ang_acc = gradient(rankle_ang_vel, dt);
lhip_ang_acc = gradient(lhip_ang_vel, dt);
lknee_ang_acc = gradient(lknee_ang_vel, dt);
lankle_ang_acc = gradient(lankle_ang_vel, dt);

%% Forces

force_data = walking_data.Alex_Walk_0001.Force;
% Force (N), Moment (Nm), COP (mm), ForcePlateLocation(mm),
% ForcePlateOffset (m)

% --- Offset correction using first 100 samples ---
nOffset = 100;

for i = 1:length(force_data)
    
    % Compute mean offset (3 x 1)
    offset = mean(force_data(i).Force(:,1:nOffset), 2);
    offset_moment = mean(force_data(i).Moment(:,1:nOffset), 2);

    % Subtract offset from all samples
    force_data(i).Force = force_data(i).Force - offset;
    force_data(i).Moment = force_data(i).Moment - offset_moment;

end

fs_force = 2000;
fc_force = 15;

[b_force, a_force] = butter(4, fc_force/(fs_force/2));

for i = 1:length(force_data)
    
    force_data(i).Force = filtfilt(b_force, a_force, force_data(i).Force')';
    force_data(i).Moment = filtfilt(b_force, a_force, force_data(i).Moment')';
    force_data(i).COP = filtfilt(b_force, a_force, force_data(i).COP')';
    
end

downsample = 10;

for i = 1:length(force_data)
    force_data(i).Force = force_data(i).Force(:,1:downsample:end);
    force_data(i).Moment = force_data(i).Moment(:,1:downsample:end);
    force_data(i).COP = force_data(i).COP(:,1:downsample:end);
    
end

N = force_data(1).NrOfSamples / 10;
fs = force_data(1).Frequency /10;
total_time = (N-1)/fs;
time = linspace(0, total_time,N);
nPlates = length(force_data);


% cops
cops_local = zeros(3,N,nPlates);

for i = 1:nPlates

    cop_x = (force_data(i).Force(1,:) * force_data(i).ForcePlateOffset(3) - force_data(i).Moment(2,:)) ./ force_data(i).Force(3,:);
    cop_y = (force_data(i).Force(2,:) * force_data(i).ForcePlateOffset(3) + force_data(i).Moment(1,:)) ./ force_data(i).Force(3,:);
    cop_z = zeros(1,N);
    cops_local(:,:,i) = [cop_x; cop_y; cop_z];

end


% torques
torque_local = zeros(3,N,nPlates);

for i = 1:nPlates

    torque_x = zeros(1,N);
    torque_y = zeros(1,N);
    torque_z = force_data(i).Moment(3,:) - cops_local(1,:,i) .* force_data(i).Force(2,:) - cops_local(2,:,i) .* force_data(i).Force(1,:);
    torque_local(:,:,i) = [torque_x; torque_y; torque_z];

end


% Plot raw force plates and local coordinate systems
figure
hold on
grid on
axis equal
xlabel('X')
ylabel('Y')
zlabel('Z')

%Visualize Global Coordinate System
quiver3(0,0,0,1,0,0,1, 'color', [1 0 0], 'HandleVisibility', 'off')
quiver3(0,0,0,0,1,0,1, 'color', [0 1 0], 'HandleVisibility', 'off')
quiver3(0,0,0,0,0,1,1, 'color', [0 0 1], 'HandleVisibility', 'off')

colors = lines(4);   % 4 distinct colors
nPlates = length(force_data);

plate_origins = zeros(3,nPlates);
plate_lcs = zeros(3,3,nPlates);
r = zeros(3,nPlates);
measurement_origins = zeros(3,nPlates);

for i = 1:nPlates
    
    % plotting force plates
    plate_location = force_data(i).ForcePlateLocation / 1000; % force plate location data in global coordinates (converted to meters)
    plot3(plate_location(:,1), plate_location(:,2), plate_location(:,3), '-o', 'Color', colors(i,:), 'DisplayName', ['Force Plate ' num2str(i)]);

    % create local coordinate system / rotation matrix
    geometric_origin = mean(plate_location, 1); % calculate geometric origin
    fp_i = (plate_location(1,:) - plate_location(2,:))/norm(plate_location(1,:) - plate_location(2,:)); % x-axis
    fp_j = (plate_location(3,:) - plate_location(2,:))/norm(plate_location(3,:) - plate_location(2,:)); % j-axis
    fp_k = cross(fp_i, fp_j) / norm(cross(fp_i, fp_j)); % z-axis

    fp_rot = [fp_i' fp_j' fp_k']; % rotation matrix in column form x,y,z

    % local coordinate systems
    quiver3(geometric_origin(1,1), geometric_origin(1,2), geometric_origin(1,3), fp_i(1,1), fp_i(1, 2), fp_i(1,3), 0.5, 'color', [1 0 0], 'HandleVisibility', 'off', 'LineWidth', 1.5);
    quiver3(geometric_origin(1,1), geometric_origin(1,2), geometric_origin(1,3), fp_j(1,1), fp_j(1, 2), fp_j(1,3), 0.5, 'color', [0 1 0], 'HandleVisibility', 'off', 'LineWidth', 1.5);
    quiver3(geometric_origin(1,1), geometric_origin(1,2), geometric_origin(1,3), fp_k(1,1), fp_k(1, 2), fp_k(1,3), 0.5, 'color', [0 0 1], 'HandleVisibility', 'off', 'LineWidth', 1.5);
    
    plate_origins(:,i)      = geometric_origin';
    plate_lcs(:,:,i)      = fp_rot;

    r(:,i) = plate_lcs(:,:,i) * force_data(i).ForcePlateOffset;
    measurement_origins(:,i) = plate_origins(:,i) + plate_lcs(:,:,i) * force_data(i).ForcePlateOffset;

end

legend
view(3)
rotate3d on
hold off

% Plot forces rotated by the rotation matrix
forces_global = zeros(3,N,nPlates);
cops_global = zeros(3,N,nPlates);
torques_global = zeros(3,N,nPlates);

for i = 1:nPlates
    forces_global(:,:,i) = plate_lcs(:,:,i) * force_data(i).Force;
    forces_global(1,:,i) = -forces_global(1,:,i);
%     cops_global(:,:,i) = plate_lcs(:,:,i) * cops_local(:,:,i) + measurement_origins(:,i);
%     %cops_global(2,:,i) = cops_local(2,:,i) + measurement_origins(:,i);
    cops_temp = plate_lcs(:,:,i) * cops_local(:,:,i) + measurement_origins(:,i);
    cops_temp(2,:) = cops_local(2,:,i) + measurement_origins(2,i);
    cops_global(:,:,i) = cops_temp;
    torques_global(:,:,i) = plate_lcs(:,:,i) * torque_local(:,:,i);
    
end

%plot_kinematics(time, cops_global(:,:,2));


% % Plot raw force plates and local coordinate systems
% figure
% hold on
% grid on
% axis equal
% xlabel('X [m]')
% ylabel('Y [m]')
% zlabel('Z [m]')
% 
% %Visualize Global Coordinate System
% quiver3(0,0,0,1,0,0,1, 'color', [1 0 0], 'HandleVisibility', 'off')
% quiver3(0,0,0,0,1,0,1, 'color', [0 1 0], 'HandleVisibility', 'off')
% quiver3(0,0,0,0,0,1,1, 'color', [0 0 1], 'HandleVisibility', 'off')
% 
% colors = lines(4);   % 4 distinct colors
% nPlates = length(force_data);
% 
% plate_origins = zeros(3,nPlates);
% plate_lcs = zeros(3,3,nPlates);
% r = zeros(3,nPlates);
% measurement_origins = zeros(3,nPlates);
% 
% for i = 1:nPlates
%     
%     % plotting force plates
%     plate_location = force_data(i).ForcePlateLocation / 1000; % force plate location data in global coordinates (converted to meters)
%     plot3(plate_location(:,1), plate_location(:,2), plate_location(:,3), '-o', 'Color', colors(i,:), 'DisplayName', ['Force Plate ' num2str(i)]);
% 
%     % create local coordinate system / rotation matrix
%     geometric_origin = mean(plate_location, 1); % calculate geometric origin
%     fp_i = (plate_location(1,:) - plate_location(2,:))/norm(plate_location(1,:) - plate_location(2,:)); % x-axis
%     fp_j = (plate_location(3,:) - plate_location(2,:))/norm(plate_location(3,:) - plate_location(2,:)); % j-axis
%     fp_k = cross(fp_i, fp_j) / norm(cross(fp_i, fp_j)); % z-axis
% 
%     fp_rot = [fp_i' fp_j' fp_k']; % rotation matrix in column form x,y,z
% 
%     plate_origins(:,i)      = geometric_origin';
%     plate_lcs(:,:,i)      = fp_rot;
% 
%     r(:,i) = plate_lcs(:,:,i) * force_data(i).ForcePlateOffset;
%     measurement_origins(:,i) = plate_origins(:,i) + plate_lcs(:,:,i) * force_data(i).ForcePlateOffset;
% 
%     % -------------------------------
%     % Plot COP trajectories on plates
%     % -------------------------------
%     for i = 1:nPlates
%         
%         % 1. Get vertical force
%         Fz = forces_global(3,:,i);
%     
%         % 2. Define contact threshold
%         threshold = 10; % Newtons (adjust if needed)
%     
%         contact_idx = Fz > threshold;
%     
%         % 3. Get COP in global coordinates
%         cop = cops_global(:,:,i);
%     
%         % 4. Remove non-contact data
%         cop(:, ~contact_idx) = NaN;
%     
%         % 5. Plot COP in 3D
%         plot3(cop(1,:), cop(2,:), cop(3,:), ...
%             'LineWidth', 2, ...
%             'Color', colors(i,:), ...
%             'DisplayName', ['COP Plate ' num2str(i)]);
%     end
% 
% 
% end
% 
% legend
% view(3)
% rotate3d on
% hold off





%% Plotting
% --- Parameters ---
threshold = 20; % N (adjust if needed)

nFrames = size(forces_global, 2);
nPlates = size(forces_global, 3);

% --- Step 1: Detect contact using Fz ---
contact = false(nFrames, nPlates);

for i = 1:nPlates
    Fz = squeeze(forces_global(3,:,i)); % vertical force
    contact(:,i) = Fz > threshold;
end

% --- Step 2: Zero out inactive forces (vectorized) ---
forces_clean = forces_global;

for i = 1:nPlates
    mask = contact(:,i)'; % make it 1 x time for broadcasting
    forces_clean(:,:,i) = forces_clean(:,:,i) .* mask;
end

% --- Step 3: Combine force plates by foot ---
% Right foot: plates 2 and 4
force_right_total = forces_clean(:,:,2) + forces_clean(:,:,4);

% Left foot: plates 1 and 3
force_left_total  = forces_clean(:,:,1) + forces_clean(:,:,3);

% --- Step 4: Inverse Dynamics ---
gravity = [0; 0; 9.81];

% Right Limb
force_rankle = foot_mass * (rfoot_com_acc - gravity) - force_right_total;

force_rknee = shank_mass * (rshank_com_acc - gravity) + ...
              foot_mass * (rfoot_com_acc - gravity) - force_right_total;

% Left Limb
force_lankle = foot_mass * (lfoot_com_acc - gravity) - force_left_total;

force_lknee = shank_mass * (lshank_com_acc - gravity) + ...
              foot_mass * (lfoot_com_acc - gravity) - force_left_total;

% --- Step 5: Plot ---
% --- RIGHT FOOT PLOT ---
figure;

subplot(3,1,1)
plot(time, force_right_total(1,:), 'color', 'red')
xlabel('Time (s)')
xlim([3,6])
ylabel('Force X (N)')

subplot(3,1,2)
plot(time, force_right_total(2,:), 'color', 'green')
xlabel('Time (s)')
xlim([3,6])
ylabel('Force Y (N)')

subplot(3,1,3)
plot(time, force_right_total(3,:), 'color', 'blue')
xlabel('Time (s)')
xlim([3,6])
ylabel('Force Z (N)')


% --- LEFT FOOT PLOT ---
figure;

subplot(3,1,1)
plot(time, force_left_total(1,:))
title('Left Foot - Fx')
xlabel('Time (s)')
ylabel('Force (N)')

subplot(3,1,2)
plot(time, force_left_total(2,:))
title('Left Foot - Fy')
xlabel('Time (s)')
ylabel('Force (N)')

subplot(3,1,3)
plot(time, force_left_total(3,:))
title('Left Foot - Fz')
xlabel('Time (s)')
ylabel('Force (N)')


plot_kinematics(time, force_lknee);

%% Inverse Dynamics
gravity = [0; 0; 9.81];

% Forces
% Right Limb
force_rankle = foot_mass * (rfoot_com_acc - gravity) - forces_global(:,:,4);
force_rknee = shank_mass * (rshank_com_acc - gravity) + foot_mass * (rfoot_com_acc - gravity) - forces_global(:,:,4);

%Left Limb
force_lankle = foot_mass * (lfoot_com_acc - gravity) - forces_global(:,:,3);
force_lknee = shank_mass * (lshank_com_acc - gravity) + foot_mass * (lfoot_com_acc - gravity) - forces_global(:,:,3);

% plot_kinematics(time, force_rankle);
% plot_kinematics(time, force_rknee);
% plot_kinematics(time, force_lankle);
% plot_kinematics(time, force_lknee);

% Segment net inertial moment
rfoot_ang_vel_local = zeros(3, numCols);
rfoot_ang_acc_local = zeros(3, numCols);
lfoot_ang_vel_local = zeros(3, numCols);
lfoot_ang_acc_local = zeros(3, numCols);
rshank_ang_vel_local = zeros(3, numCols);
rshank_ang_acc_local = zeros(3, numCols);
lshank_ang_vel_local = zeros(3, numCols);
lshank_ang_acc_local = zeros(3, numCols);

for i = 1:numCols
    rfoot_ang_vel_local(:,i) = R_foot(:,:,i)' * rfoot_ang_vel(:,i);
    rfoot_ang_acc_local(:,i) = R_foot(:,:,i)' * rfoot_ang_acc(:,i);
    lfoot_ang_vel_local(:,i) = L_foot(:,:,i)' * lfoot_ang_vel(:,i);
    lfoot_ang_acc_local(:,i) = L_foot(:,:,i)' * lfoot_ang_acc(:,i);
    rshank_ang_vel_local(:,i) = R_shank(:,:,i)' * rshank_ang_vel(:,i);
    rshank_ang_acc_local(:,i) = R_shank(:,:,i)' * rshank_ang_acc(:,i);
    lshank_ang_vel_local(:,i) = L_shank(:,:,i)' * lshank_ang_vel(:,i);
    lshank_ang_acc_local(:,i) = L_shank(:,:,i)' * lshank_ang_acc(:,i);
end

rfoot_inert_moment_local = rfoot_I * rfoot_ang_acc_local + cross(rfoot_ang_vel_local, (rfoot_I * rfoot_ang_vel_local), 1);
lfoot_inert_moment_local = lfoot_I * lfoot_ang_acc_local + cross(lfoot_ang_vel_local, (lfoot_I * lfoot_ang_vel_local), 1);
rshank_inert_moment_local = rshank_I * rshank_ang_acc_local + cross(rshank_ang_vel_local, (rshank_I * rshank_ang_vel_local), 1);
lshank_inert_moment_local = lshank_I * lshank_ang_acc_local + cross(lshank_ang_vel_local, (lshank_I * lshank_ang_vel_local), 1);

% global net inertial moment
rfoot_inert_moment = zeros(3, numCols);
lfoot_inert_moment = zeros(3, numCols);
rshank_inert_moment = zeros(3, numCols);
lshank_inert_moment = zeros(3, numCols);

for i = 1:numCols
    rfoot_inert_moment(:,i) = R_foot(:,:,i) * rfoot_inert_moment_local(:,i);
    lfoot_inert_moment(:,i) = L_foot(:,:,i) * lfoot_inert_moment_local(:,i);
    rshank_inert_moment(:,i) = R_shank(:,:,i) * rshank_inert_moment_local(:,i);
    lshank_inert_moment(:,i) = L_shank(:,:,i) * lshank_inert_moment_local(:,i);
end

% Moment
% Quasi Static Moment
rankle_moment_static = - cross((rankle_center_global - cops_global(:,:,2)), forces_global(:,:,2)) + cross((rankle_center_global - rfoot_com_pos), (foot_mass * (rfoot_com_acc - gravity)));
rknee_moment_static = cross((rknee_center_global - rshank_com_pos), shank_mass * (rshank_com_acc - gravity)) + cross((rknee_center_global - rfoot_com_pos), foot_mass * (rfoot_com_acc - gravity)) - cross(rknee_center_global - cops_global(:,:,2), forces_global(:,:,2));

%plot_kinematics(time, rankle_moment_static);
%plot_kinematics(time, rknee_moment_static);

% Testing
test = torques_global(:,:,2);
plot_kinematics(time, test);

% Complete Moment
rankle_moment_4 = rfoot_inert_moment - torques_global(:,:,4) - cross((rankle_center_global - cops_global(:,:,4)), forces_global(:,:,4)) + cross((rankle_center_global - rfoot_com_pos), (foot_mass * (rfoot_com_acc - gravity)));
rankle_moment_2 = rfoot_inert_moment - torques_global(:,:,2) - cross((rankle_center_global - cops_global(:,:,2)), forces_global(:,:,2)) + cross((rankle_center_global - rfoot_com_pos), (foot_mass * (rfoot_com_acc - gravity)));
rknee_moment_4 = rfoot_inert_moment - rshank_inert_moment + cross((rknee_center_global - rshank_com_pos), shank_mass * (rshank_com_acc - gravity)) + cross((rknee_center_global - rfoot_com_pos), foot_mass * (rfoot_com_acc - gravity)) - torques_global(:,:,4) - cross(rknee_center_global - cops_global(:,:,4), forces_global(:,:,4));
rknee_moment_2 = rfoot_inert_moment - rshank_inert_moment + cross((rknee_center_global - rshank_com_pos), shank_mass * (rshank_com_acc - gravity)) + cross((rknee_center_global - rfoot_com_pos), foot_mass * (rfoot_com_acc - gravity)) - torques_global(:,:,2) - cross(rknee_center_global - cops_global(:,:,2), forces_global(:,:,2));
rknee_moment_2(3,:) = -rknee_moment_2(3,:);

%plot_kinematics(time, rankle_moment_2);
plot_kinematics(time, -rankle_moment_2)
plot_kinematics(time, -rknee_moment_2);


%% Function

% Function for segment inertia and segment com
function [I_xx, I_yy, I_zz, r_prime, I] = frustum_inertia(distal_radius, proximal_radius, length, M)
    x = distal_radius / proximal_radius;
    c = ((1 + 2*x + 3*x^2)/(4*(1 + x + x^2)));
    r_prime = [0; 0; -c*length];

    delta = (3*M) / (length * (proximal_radius^2 + distal_radius*proximal_radius + distal_radius^2) * pi);

    a1 = 9 / (20*pi);
    a2 = (1 + x + x^2 + x^3 + x^4) / (1 + x + x^2)^2;
    b1 = 3 / 80;
    b2 = (1 + 4*x + 10*x^2 + 4*x^3 + x^4) / (1 + x + x^2)^2;

    I_xx = (a1*a2*M^2) / (delta*length) + b1*b2*M*length^2;
    I_yy = I_xx;
    I_zz = (2*a1*a2*M^2) / (delta*length);
    I = diag([I_xx, I_yy, I_zz]);

end

% Function for pelvis segment inertia and pelvis segment com
function [I_xx, I_yy, I_zz, r_prime, I] = cylinder_inertia(R, D, L, M)
    I_xx = M * (3*D^2 + L^2) / 12;  % medial/lateral
    I_yy = M * (3*R^2 + L^2) / 12;  % anterior/posterior
    I_zz = M * (D^2 + R^2) / 4;     % axial
    r_prime = [0; 0; -0.5*L];
    I = diag([I_xx, I_yy, I_zz]);
end

% Function for COM translational velocity
function vel = compute_vel(pos, dt)
    n = size(pos, 2);
    vel = zeros(size(pos));
    vel(:,1)   = (pos(:,2) - pos(:,1)) / dt;
    for i = 2:n-1
        vel(:,i) = (pos(:,i+1) - pos(:,i-1)) / (2*dt);
    end
    vel(:,n)   = (pos(:,n) - pos(:,n-1)) / dt;
end

% Function for COM translational acceleration
function acc = compute_acc(pos, dt)
    n = size(pos, 2);
    acc = zeros(size(pos));
    acc(:,1)   = (pos(:,3) - 2*pos(:,2) + pos(:,1)) / dt^2;
    for i = 2:n-1
        acc(:,i) = (pos(:,i+1) - 2*pos(:,i) + pos(:,i-1)) / dt^2;
    end
    acc(:,n)   = (pos(:,n) - 2*pos(:,n-1) + pos(:,n-2)) / dt^2;
end

% Plot kinematics
function plot_kinematics(time, data)
    labels = {'Moment X [N/m]', 'Moment Y [N/m]', 'Moment Z [N/m]'};
    colors = {'r', 'g', 'b'};
    figure;
    for ax = 1:3
        subplot(3,1,ax);
        plot(time, data(ax,:), colors{ax});
        xline(822/200, 'k-', 'LineWidth', 1);
        xline(1044/200, 'k-', 'LineWidth', 1);
        xlim([3, 6]);
        %xlim([0, 10]);
        xlabel('Time [s]');
        ylabel(labels{ax});
        grid on;
    end
end

% Plot kinematics
function plot_kinematics_ang(time, data)
    labels = {'Flex(+) / Ext(-)', 'Add(+) / Abd(-)', 'Ext(+) / Int(-)'};
    colors = {'r', 'g', 'b'};
    
    figure;
    for ax = 1:3
        subplot(3,1,ax);
        plot(time, data(:,ax), colors{ax});  % <-- switched to (:,ax)
        xline(822/200, 'k-', 'LineWidth', 1);
        xline(1044/200, 'k-', 'LineWidth', 1);
        xlim([3, 6]);
        xlabel('Time [s]');
        ylabel(labels{ax});
        grid on;
    end
end

% This function plots the local coordinate systems of the segments
function plotLCS(segment)
    origin = segment(:,4);

    colors = [1 0 0; 0 1 0; 0 0 1]; %red, green, blue

    for i = 1:3
        quiver3(origin(1), origin(2), origin(3), segment(1,i), segment(2,i), segment(3,i), 0.1, 'color', colors(i,:), 'HandleVisibility', 'off', 'LineWidth', 1.5);
    end
end

function w = calculateRotMatAngularVelocity(R,Fs,out)

% Calculate the angular velocity from a rotation matrix. Rotation matrix
% must represent LOCAL to GLOBAL transformation (i.e. column unit vectors 
% of the co-ordinate system)
% 
% Beware, this method becomes less valid for larger rotations. 
% At 5 deg/s, error is +- 0.006 deg/s
% At 10 deg/s, error is +- 0.05 deg/s
% At 15 deg/s, error is +- 0.17 deg/s
% At 20 deg/s, error is +- 0.40 deg/s
% Continues exponentially.
% 
% L.Welte Feb 2019. Cope's Method from Dr. Richards.
%  Edit history:
%   - 2019/06 Added option for radian output
% 
% ----------------------------Input variables ----------------------------
% 
% R         =       3x3xn rotation matrix
% 
% Fs        =       Frame rate in Hz
% 
% out       =       'deg' or 'rad' Optional argument. Default is degrees.
% 
% ----------------------------Output variables----------------------------
% 
% w         =       (3x1xn) angular velocity in global, in degrees/s
% 
% ------------------------------------------------------------------------


nfr = size(R,3);
if size(R,1) ~= 3 || size(R,2) ~= 3 
    error('The input rotation matrix is incorrectly sized. It should be 3 x 3 x n.')
elseif size(R,3) < 2
    error('The input rotation matrix needs more than one frame of data.')
end

if nargin < 3
   outType = 'deg';
else 
    outType = out;
end

dt = 1/Fs; 

% Define the derivative rotation matrix
R_dot = nan(3,3,nfr);
R_G2L = nan(3,3,nfr);
w_L = nan(3,nfr);
w = nan(3,nfr);
for i = 1:nfr
    if i == 1 % deal with start and end frames with forwards/backwards finite difference
        R_dot(:,:,i) = (R(:,:,i+1)-R(:,:,i)) / (dt);
    elseif i == nfr
        R_dot(:,:,i) = (R(:,:,i)-R(:,:,i-1)) / (dt);
    elseif i == 2% do central finite difference
        R_dot(:,:,i) = (R(:,:,i+1) - R(:,:,i-1)) / (2*dt);
    elseif i == nfr-1% do central finite difference
        R_dot(:,:,i) = (R(:,:,i+1) - R(:,:,i-1)) / (2*dt);
    else
        R_dot(:,:,i) = (-1/12 * R(:,:,i+2) +2/3 * R(:,:,i+1) - 2/3 * R(:,:,i-1)+1/12 * R(:,:,i-2)) / (dt);
    end
    R_G2L(:,:,i) = R(:,:,i)';
    w_L_full =  R_G2L(:,:,i)*R_dot(:,:,i);
% calculate omega in the local co-ordinate system
    w_L(1:3,i) = [w_L_full(3,2); w_L_full(1,3);w_L_full(2,1)];

%    calculate omega global
    
w(1:3,i) = R(:,:,i) * w_L(1:3,i);

if strcmp(outType,'deg')
    
    w(1:3,i) = w(1:3,i)*180/pi();
    
end
   
end
end