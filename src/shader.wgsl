struct VsOutput {
  @builtin(position) position: vec4f,
  @location(0) color: vec4f,
}

@group(0) 
@binding(0)
var<uniform> uniform_struct: UniformStruct;

@vertex fn vs(@builtin(vertex_index) index: u32) -> @builtin(position) vec4f {
  let pos = array(
    vec2f( 0.0,  0.5),  // top center
    vec2f(-0.5, -0.5),  // bottom left
    vec2f( 0.5, -0.5)   // bottom right
  );

  return vec4f(pos[index] * uniform_struct.scale + uniform_struct.offset, 0.0, 1.0);
}

@fragment fn fs() -> @location(0) vec4f {
  return uniform_struct.color;
}
