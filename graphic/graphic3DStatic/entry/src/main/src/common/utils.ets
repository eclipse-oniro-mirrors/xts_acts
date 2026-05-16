/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Node, Quaternion, Vec3, Vec4 } from '@ohos.graphics.scene'

function sub(l: Vec3, r: Vec3): Vec3 {
  return { x: l.x - r.x, y: l.y - r.y, z: l.z - r.z };
}

function dot(l: Vec3, r: Vec3): double {
  return l.x * r.x + l.y * r.y + r.z * l.z;
}

function normalize(l: Vec3): Vec3 {
  let d = Math.sqrt(dot(l, l));
  return { x: l.x / d, y: l.y / d, z: l.z / d };
}

function cross(l: Vec3, r: Vec3): Vec3 {
  return { x: (l.y * r.z - l.z * r.y), y: (l.z * r.x - l.x * r.z), z: (l.x * r.y - l.y * r.x) };
}

function mul(l: Quaternion, d: double): Quaternion {
  return {
    x: l.x * d,
    y: l.y * d,
    z: l.z * d,
    w: l.w * d
  };
}

function lookAt(node: Node, eye: Vec3, center: Vec3, up: Vec3) {

  let t: double;

  let q: Quaternion = {
    x: 0.0,
    y: 0.0,
    z: 0.0,
    w: 0.0
  };
  let f = normalize(sub(center, eye));
  let m0 = normalize(cross(f, up));
  let m1 = cross(m0, f);
  let m2: Vec3 = { x: -f.x, y: -f.y, z: -f.z };
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

function sleep(time: int) {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`);
  })
}

function GenRandom(): number {
  return Math.random() * 2 - 1;
}

function doubleEqual(a: double, b: double, epsilon: double = 1e-6): boolean {
  return Math.abs(a - b) < epsilon;
}

function vec4ToString(data: Vec4): string {
  return `Vec4(${data.x}, ${data.y}, ${data.z}, ${data.w})`;
}

export { lookAt, sleep, GenRandom, doubleEqual, vec4ToString };