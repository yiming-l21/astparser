pub fn get_fnn(n:u32)->u32{
	if n==1_u32 {
		return 1_u32;
	}
	get_fnn(n-1_u32)*n
}
pub fn fibona_fn(n:u32)->u32{
	match n{
	    1_u32=>1_u32,
        0_u32=>0_u32, 
        _=>	fibona_fn(n-1)+fibona_fn(n-2),
    }

}
