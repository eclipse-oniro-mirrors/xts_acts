/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

class Point {
  public x: int;
  public y: int;
  public getRadius: (p: Point) => double = (p: Point) => Math.sqrt(p.x * p.x + p.y * p.y);
}

class ExtendedPoint extends Point {
  public z: int;
}

class Vector {
  private p1: Point | ExtendedPoint | null = null;
  private p2: Point | ExtendedPoint | null = null;
  public readonly length: number;
}

interface IFigure {
  points: ExtendedPoint[];
  vectors: Vector[];
}

class Circle implements IFigure {
  public points: ExtendedPoint[] = [];
  public vectors: Vector[] = [];
  protected radius: Vector = new Vector();
  protected center: Point | ExtendedPoint = new Point();
}

class Sphere extends Circle {}

class Space {
  public objects: [Circle, Sphere, Vector, ExtendedPoint, Point];
  public dimension: int;
  constructor(objects: [Circle, Sphere, Vector, ExtendedPoint, Point]) {
    this.objects = objects
  }
  public name?: string;
}

class UniversalFigureHandler {
  public figure: Partial<IFigure>;
  constructor(figure: Partial<IFigure>) {
    this.figure = figure;
  }
}

class NamedSpaceHandler {
  public space: Required<Space>;
  constructor(space: Required<Space>) {
    this.space = space;
  }
}
