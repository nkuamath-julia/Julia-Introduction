### A Pluto.jl notebook ###
# v0.19.23

using Markdown
using InteractiveUtils

# ╔═╡ c3f5e2c1-d31f-4175-a66f-764afe0eb21f
html"""
<center><h1> Choosing most accurate mathematical formula </h1></center>
<br>
<p>
Let r be the radius of a sphere. The area of the sphere is calculated using:  
</p>
<math display="block">	
	<msup> 
		<mi>E = 4πr</mi> 
		<mn>2</mn> 
	</msup>
<\math>
<br>
<br>
<br>
<p>We will alter the radius by some <math display="inline"> <mi>dr</mi>  </math> and we will calculate the change of the sphere's area, let <math display="inline"> <mi>dE</mi> </math>.
</p>
"""

# ╔═╡ 5788b1fa-3bb3-48d9-b12e-32b2862a5898
html"""

<p>
First way: 
We calculate the difference between the two areas. We derive:
<math display="block">	
	<msup> 
		<mi>dE = 4π(r+dr)</mi> 
		<mn>2</mn> 
	</msup>
	<msup> 
		<mi> - 4πr</mi> 
		<mn>2</mn> 
	</msup>
<\math>
</p>
"""

# ╔═╡ 0f9e70e3-663a-4975-84fd-7019a8005509
html"""

<p>
Second way: 
We use the identity 
<math display="inline"> 
	<msup> 
		<mi>a</mi> 
		<mn>2</mn> 
	</msup>
	<msup> 
		<mi>-b</mi> 
		<mn>2</mn> 
	</msup>
	<msup> 
		<mi>= (a+b)(a-b)</mi> 
	</msup>
</math>. We derive:
<math display="block">	
	<msup> 
		<mi>dE = 4π(r+dr)</mi> 
		<mn>2</mn> 
	</msup>
	<msup> 
		<mi> - 4πr</mi> 
		<mn>2</mn> 
	</msup>
<\math>
</p>
"""

# ╔═╡ 1101e156-176d-4def-968d-dd538f079bb9
html"""
<p>
After selecting <math display="inline"> <mi> dr </mi> </math>, we compute the exact value of <math display="inline"> <mi> dE </mi> </math>, using the BigFloat datatype which is supported by Julia (it doesn't matter which formula we will use, since the difference in the result would be negligible).
</p>
"""

# ╔═╡ f2576482-b18f-4f25-8907-94513ea58c22
html"""
<p>
Then, we convert <math display="inline"> <mi> dr </mi> </math> back into the usual Float64 datatype and we calculate <math display="inline"> <mi> dE </mi> </math> using the two aforementioned formulas. 
</p>
"""

# ╔═╡ b6f202ab-1d7a-4335-b064-64151a77b195
html"""
<p>
Finally, we compute these two relative errors:
</p>
"""

# ╔═╡ fbcafcb5-28a7-4787-a0c9-0f3f6683a951
html"""
<p>
	<math display="block">
<mi> rel1 = | </mi>
		 <mfrac>
			<msub>
				<mi>dE-dE</mi>
				<mn>1</mn>
			</msub> 
			<mi>dE</mi>
		</mfrac>
<mi>|</mi>
	</math>
<br>
</p>

"""

# ╔═╡ c092257e-c239-4529-82ee-cd28df48a60d
html"""
<p>
	<math display="block">
<mi> rel2 = | </mi>
		 <mfrac>
			<msub>
				<mi>dE-dE</mi>
				<mn>2</mn>
			</msub> 
			<mi>dE</mi>
		</mfrac>
<mi>|</mi>
	</math>
<br>
</p>

"""

# ╔═╡ b7766f91-e437-4ef7-8097-b216a79286a9
html"""
<p>
Our code should look like this. 
</p>
"""

# ╔═╡ f13a2d69-875e-423f-8571-759478041a6d
function sphere_area(n)
    r = 6367 # Earth's radius in kilometers
    err1 = err2 = 0
    count1 = count2 = 0
    for i in 1:n
        dr = rand(BigFloat)
        dE = Float64(4*pi*(r+dr)^2 - 4*pi*r^2)
#print(dE)
        dr = Float64(dr)
        dE1 = 4*pi*(r+dr)^2 - 4*pi*r^2
#print(dE1)
        dE2 = 4*pi*dr*(2*r+dr)
#print(dE2)
        err1 = abs(dE-dE1)/dE
        err2 = abs(dE-dE2)/dE
        if err1 < err2
            count1 += 1
        elseif err2 < err1
            count2 += 1
        end
    end
    return [count1, count2]
end


# ╔═╡ afd6a481-4d64-4514-8332-fa005cea36b6
sphere_area(100)

# ╔═╡ Cell order:
# ╟─c3f5e2c1-d31f-4175-a66f-764afe0eb21f
# ╟─5788b1fa-3bb3-48d9-b12e-32b2862a5898
# ╟─0f9e70e3-663a-4975-84fd-7019a8005509
# ╟─1101e156-176d-4def-968d-dd538f079bb9
# ╟─f2576482-b18f-4f25-8907-94513ea58c22
# ╟─b6f202ab-1d7a-4335-b064-64151a77b195
# ╟─fbcafcb5-28a7-4787-a0c9-0f3f6683a951
# ╟─c092257e-c239-4529-82ee-cd28df48a60d
# ╠═b7766f91-e437-4ef7-8097-b216a79286a9
# ╠═f13a2d69-875e-423f-8571-759478041a6d
# ╠═afd6a481-4d64-4514-8332-fa005cea36b6
