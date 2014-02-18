% function distortion = dtw(A, B)
	
% 	% A, B = vectors  
% 	A_num_frames = size(A, 1);
% 	B_num_frames = size(B, 1);

% 	% fprintf('A has %d frames\n', A_num_frames);
% 	% fprintf('B has %d frames\n', B_num_frames);

% 	G = zeros(A_num_frames, B_num_frames);

% 	for i = 1: A_num_frames
% 		for j = 1: B_num_frames
% 			% fprintf('%d, %d\n', i, j)
% 			if i == 1 && j == 1
% 				% fprintf('dist = %f', d(A(i), B(j)))
% 				G(i, j) = 2*d(A(i), B(j));
% 			elseif i == 1
% 				G(i, j) = G(i, j-1) + d(A(i), B(j));
% 			elseif j == 1
% 				G(i, j) = G(i-1, j) + d(A(i), B(j));
% 			else
% 				dd = d(A(i), B(j));

% 				left_g = G(i, j-1) + dd;
% 				up_g = G(i-1, j) + dd;
% 				diag_g = G(i-1, j-1) + 2*dd;

% 				G(i, j) = min([left_g, up_g, diag_g]);
% 			end
% 		end
% 	end
% 	distortion = G(A_num_frames, B_num_frames)/(A_num_frames + B_num_frames);
% end

function dist = d(a, b)
	dist = sum((a - b).^2);
end



function distortion = dtw(A, B)
	
	% A, B = matrices
	A_num_frames = size(A, 1);
	B_num_frames = size(B, 1);

	% fprintf('A has %d frames\n', A_num_frames);
	% fprintf('B has %d frames\n', B_num_frames);

	G = zeros(A_num_frames, B_num_frames);

	for i = 1: A_num_frames
		for j = 1: B_num_frames
			% fprintf('%d, %d\n', i, j)
			if i == 1 && j == 1
				% fprintf('dist = %f', d(A(i), B(j)))
				G(i, j) = 2*d(A(i,:), B(j,:));
			elseif i == 1
				G(i, j) = G(i, j-1) + d(A(i,:), B(j,:));
			elseif j == 1
				G(i, j) = G(i-1, j) + d(A(i,:), B(j,:));
			else
				dd = d(A(i,:), B(j,:));

				left_g = G(i, j-1) + dd;
				up_g = G(i-1, j) + dd;
				diag_g = G(i-1, j-1) + 2*dd;

				G(i, j) = min([left_g, up_g, diag_g]);
			end
		end
	end
	distortion = G(A_num_frames, B_num_frames)/(A_num_frames + B_num_frames);
end
