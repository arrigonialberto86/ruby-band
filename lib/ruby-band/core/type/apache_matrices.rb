require 'java'

module Core
  module Type

  	java_import 'org.apache.commons.math3.linear.BlockRealMatrix'
  	java_import 'org.apache.commons.math3.linear.Array2DRowRealMatrix'

  	#Define variables to use ruby-like names instead of Java's
  	Apache_matrix = Array2DRowRealMatrix
  	Apache_matrix_block = BlockRealMatrix

  	#* *Description*    :  	
		#Linear algebra support in commons-math provides operations on real matrices (both dense 
		#and sparse matrices are supported) and vectors. It features basic operations (addition, subtraction ...) 
		#and decomposition algorithms that can be used to solve linear systems either in exact sense and 
		#in least squares sense.
		#The 'Apache_matrix' class represents a matrix with real numbers as entries. 
		#The following basic matrix operations are supported:
		#- Matrix addition, subtraction, multiplication
 		#- Scalar addition and multiplication
 		#- Transpose
 		#- Norm and trace
 		#- Operation on a vector
		class Apache_matrix 

		end

		# Apache matrix implementation suited to dimensions above 50 or 100
		class Apache_matrix_block

		end

	end
end
