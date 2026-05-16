import scene3d from '@ohos.graphics.scene'

function sub(l: scene3d.Vec3, r: scene3d.Vec3): scene3d.Vec3 {
  return { x: l.x - r.x, y: l.y - r.y, z: l.z - r.z };
}
function dot(l: scene3d.Vec3, r: scene3d.Vec3): number {
  return l.x * r.x + l.y * r.y + r.z * l.z;
}
function normalize(l: scene3d.Vec3): scene3d.Vec3 {
  let d = Math.sqrt(dot(l, l));
  return { x: l.x / d, y: l.y / d, z: l.z / d };
}
function cross(l: scene3d.Vec3, r: scene3d.Vec3): scene3d.Vec3 {
  return { x: (l.y * r.z - l.z * r.y), y: (l.z * r.x - l.x * r.z), z: (l.x * r.y - l.y * r.x) };
}
function mul(l: scene3d.Quaternion, d: number): scene3d.Quaternion {
  return {
    x: l.x * d,
    y: l.y * d,
    z: l.z * d,
    w: l.w * d
  };
}
function lookAt(node: scene3d.Node, eye: scene3d.Vec3, center: scene3d.Vec3, up: scene3d.Vec3) {

  let t: number;

  let q: scene3d.Quaternion = {
    x: 0.0,
    y: 0.0,
    z: 0.0,
    w: 0.0
  };
  let f = normalize(sub(center, eye));
  let m0 = normalize(cross(f, up));
  let m1 = cross(m0, f);
  let m2: scene3d.Vec3 = { x: -f.x, y: -f.y, z: -f.z };
  if (m2.z < 0) {
    if (m0.x > m1.y) {
      t = 1.0 + m0.x - m1.y - m2.z;
      q = {
        x: t,
        y: m0.y + m1.x,
        z: m2.x + m0.z,
        w: m1.z - m2.y
      };
    } else {
      t = 1.0 - m0.x + m1.y - m2.z;
      q = {
        x: m0.y + m1.x,
        y: t,
        z: m1.z + m2.y,
        w: m2.x - m0.z
      };
    }
  } else {
    if (m0.x < -m1.y) {
      t = 1.0 - m0.x - m1.y + m2.z;
      q = {
        x: m2.x + m0.z,
        y: m1.z + m2.y,
        z: t,
        w: m0.y - m1.x
      };
    } else {
      t = 1.0 + m0.x + m1.y + m2.z;
      q = {
        x: m1.z - m2.y,
        y: m2.x - m0.z,
        z: m0.y - m1.x,
        w: t
      }
    }
  }
  node.position = eye;
  node.rotation = mul(q, 0.5 / Math.sqrt(t));
}

function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve();
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`);
  })
}

function GenRandom(): number {
  return Math.random() * 2 - 1;
}

export { lookAt, sleep, GenRandom };