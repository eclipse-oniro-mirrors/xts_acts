/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
@Entry
@Component
struct CanvasAPI {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private context2: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private context3: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private context4: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private context5: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private context6: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private img: ImageBitmap = new ImageBitmap("pages/images/img1.png")
  private canvasPattern: CanvasPattern;
  private path2Da: Path2D = new Path2D("M250 0 L350 0 L350 200 L250 200 L250 0")
  private path2Db: Path2D = new Path2D()

  createMatrix2D(a: number, b: number, c: number, d: number, e: number, f: number) {
    let matrix2d: Matrix2D = new Matrix2D();
    matrix2d.scaleX = a;
    matrix2d.rotateY = b;
    matrix2d.rotateX = c;
    matrix2d.scaleY = d;
    matrix2d.translateX = e;
    matrix2d.translateY = f;
    return matrix2d;
  }

  build() {
    Scroll() {
      Column({ space: 5 }) {
        Canvas(this.context)
          .width('100%')
          .height('500px')
          .backgroundColor('#ff83835d')
          .margin({ top: 5 })
          .key('CanvasAPI_Canvas1')
          .onReady(() => {
            this.noTransform()
            this.transformByField1()
            this.transformByField2()
            this.transformByField3()
            this.scaleByField1()
            this.scaleByField2()
            this.scaleByField3()
            this.rotateByField1()
            this.rotateByField2()
            this.rotateByField3()
            this.rotateByField4()
            this.rotateByField5()
            this.transformByFunc1()
            this.transformByFunc2()
            this.transformByFunc3()
            this.rotateByFunc1()
            this.rotateByFunc2()
            this.rotateByFunc3()
            this.scaleByFunc1()
            this.scaleByFunc2()
            this.scaleByFunc3()
            this.identity1()
            this.identity2()
            this.identity3()
            this.invert1()
            this.invert2()
            this.invert3()
          })
      }
      .width('100%')
      .backgroundColor('#eee')
    }
  }

  noTransform() {
    this.canvasPattern = this.context.createPattern(this.img, 'no-repeat');
    let matrix2d = this.createMatrix2D(1, 0, 0, 1, 0, 0)
    this.canvasPattern.setTransform(matrix2d);
    this.context.fillStyle = this.canvasPattern;
    this.context.fillRect(0, 0, 400, 350)
    this.path2Db.addPath(this.path2Da, matrix2d)
    this.context.stroke(this.path2Db)
  }

  transformByField1() {
    let canvasPattern = this.context.createPattern(this.img, 'no-repeat');
    let matrix2d = this.createMatrix2D(1, 0, 0, 1, 50, 0)
    canvasPattern.setTransform(matrix2d);
    this.context.fillStyle = canvasPattern;
    this.context.fillRect(0, 0, 400, 350)

    let path2Db = new Path2D()
    path2Db.addPath(this.path2Da, matrix2d)
    this.context.stroke(path2Db)

  }

  transformByField2() {
    let canvasPattern = this.context3.createPattern(this.img, 'no-repeat');
    let matrix2d = this.createMatrix2D(1, 0, 0, 1, 0, 50)
    canvasPattern.setTransform(matrix2d);
    this.context3.fillStyle = canvasPattern;
    this.context3.fillRect(0, 0, 400, 350)

    let path2Db = new Path2D()
    path2Db.addPath(this.path2Da, matrix2d)
    this.context3.stroke(path2Db)
  }

  transformByField3() {
    let canvasPattern = this.context4.createPattern(this.img, 'no-repeat');
    let matrix2d = this.createMatrix2D(1, 0, 0, 1, 50, 50)
    canvasPattern.setTransform(matrix2d);
    this.context4.fillStyle = canvasPattern;
    this.context4.fillRect(0, 0, 400, 350)

    let path2Db = new Path2D()
    path2Db.addPath(this.path2Da, matrix2d)
    this.context4.stroke(path2Db)
  }

  scaleByField1() {
    let canvasPattern = this.context2.createPattern(this.img, 'no-repeat');
    let matrix2d = this.createMatrix2D(1.5, 0, 0, 1, 0, 0)
    canvasPattern.setTransform(matrix2d);
    this.context2.fillStyle = canvasPattern;
    this.context2.fillRect(0, 0, 400, 350)

    let path2Db = new Path2D()
    path2Db.addPath(this.path2Da, matrix2d)
    this.context2.stroke(path2Db)
  }

  scaleByField2() {
    let canvasPattern = this.context3.createPattern(this.img, 'no-repeat');
    let matrix2d = this.createMatrix2D(1, 0, 0, 1.5, 0, 0)
    canvasPattern.setTransform(matrix2d);
    this.context3.fillStyle = canvasPattern;
    this.context3.fillRect(0, 0, 400, 350)

    let path2Db = new Path2D()
    path2Db.addPath(this.path2Da, matrix2d)
    this.context3.stroke(path2Db)
  }

  scaleByField3() {
    let canvasPattern = this.context4.createPattern(this.img, 'no-repeat');
    let matrix2d = this.createMatrix2D(1.5, 0, 0, 1.5, 0, 0)
    canvasPattern.setTransform(matrix2d);
    this.context4.fillStyle = canvasPattern;
    this.context4.fillRect(0, 0, 400, 350)

    let path2Db = new Path2D()
    path2Db.addPath(this.path2Da, matrix2d)
    this.context4.stroke(path2Db)
  }

  rotateByField1() {
    let canvasPattern = this.context2.createPattern(this.img, 'no-repeat');
    let matrix2d = this.createMatrix2D(1, -1, 0, 1, 0, 0)
    canvasPattern.setTransform(matrix2d);
    this.context2.fillStyle = canvasPattern;
    this.context2.fillRect(0, 0, 400, 350)

    let path2Db = new Path2D()
    path2Db.addPath(this.path2Da, matrix2d)
    this.context2.stroke(path2Db)
  }

  rotateByField2() {
    let canvasPattern = this.context3.createPattern(this.img, 'no-repeat');
    let matrix2d = this.createMatrix2D(1, 1, 0, 1, 0, 0)
    canvasPattern.setTransform(matrix2d);
    this.context3.fillStyle = canvasPattern;
    this.context3.fillRect(0, 0, 400, 350)

    let path2Db = new Path2D()
    path2Db.addPath(this.path2Da, matrix2d)
    this.context3.stroke(path2Db)
  }

  rotateByField3() {
    let canvasPattern = this.context4.createPattern(this.img, 'no-repeat');
    let matrix2d = this.createMatrix2D(1, 0, -1, 1, 0, 0)
    canvasPattern.setTransform(matrix2d);
    this.context4.fillStyle = canvasPattern;
    this.context4.fillRect(0, 0, 400, 350)

    let path2Db = new Path2D()
    path2Db.addPath(this.path2Da, matrix2d)
    this.context4.stroke(path2Db)
  }

  rotateByField4() {
    let canvasPattern = this.context5.createPattern(this.img, 'no-repeat');
    let matrix2d = this.createMatrix2D(1, 0, 1, 1, 0, 0)
    canvasPattern.setTransform(matrix2d);
    this.context5.fillStyle = canvasPattern;
    this.context5.fillRect(0, 0, 400, 350)

    let path2Db = new Path2D()
    path2Db.addPath(this.path2Da, matrix2d)
    this.context5.stroke(path2Db)
  }

  rotateByField5() {
    let canvasPattern = this.context6.createPattern(this.img, 'no-repeat');
    let matrix2d = this.createMatrix2D(1, -1, 1, 1, 0, 0)
    canvasPattern.setTransform(matrix2d);
    this.context6.fillStyle = canvasPattern;
    this.context6.fillRect(0, 0, 400, 350)

    let path2Db = new Path2D()
    path2Db.addPath(this.path2Da, matrix2d)
    this.context6.stroke(path2Db)
  }

  transformByFunc1() {
    let canvasPattern = this.context.createPattern(this.img, 'no-repeat');
    let matrix2d = this.createMatrix2D(1, 0, 0, 1, 0, 0).translate(100);
    canvasPattern.setTransform(matrix2d);
    this.context.fillStyle = canvasPattern;
    this.context.fillRect(0, 0, 400, 350)

    let path2Db = new Path2D()
    path2Db.addPath(this.path2Da, matrix2d)
    this.context.stroke(path2Db)
  }

  transformByFunc2() {
    let canvasPattern = this.context2.createPattern(this.img, 'no-repeat');
    let matrix2d = this.createMatrix2D(1, 0, 0, 1, 0, 0).translate(0, 100);
    canvasPattern.setTransform(matrix2d);
    this.context2.fillStyle = canvasPattern;
    this.context2.fillRect(0, 0, 400, 350)

    let path2Db = new Path2D()
    path2Db.addPath(this.path2Da, matrix2d)
    this.context2.stroke(path2Db)
  }

  transformByFunc3() {
    let canvasPattern = this.context3.createPattern(this.img, 'no-repeat');
    let matrix2d = this.createMatrix2D(1, 0, 0, 1, 0, 0).translate(100, 100);
    canvasPattern.setTransform(matrix2d);
    this.context3.fillStyle = canvasPattern;
    this.context3.fillRect(0, 0, 400, 350)

    let path2Db = new Path2D()
    path2Db.addPath(this.path2Da, matrix2d)
    this.context3.stroke(path2Db)
  }

  rotateByFunc1() {
    let canvasPattern = this.context.createPattern(this.img, 'no-repeat');
    let matrix2d = this.createMatrix2D(1, 0, 0, 1, 0, 0).rotate(45 * Math.PI / 180, 0, 0);
    canvasPattern.setTransform(matrix2d);
    this.context.fillStyle = canvasPattern;
    this.context.fillRect(0, 0, 400, 350)

    let path2Db = new Path2D()
    path2Db.addPath(this.path2Da, matrix2d)
    this.context.stroke(path2Db)
  }

  rotateByFunc2() {
    let canvasPattern = this.context2.createPattern(this.img, 'no-repeat');
    let matrix2d = this.createMatrix2D(1, 0, 0, 1, 0, 0).rotate(-45 * Math.PI / 180, 0, 0);
    canvasPattern.setTransform(matrix2d);
    this.context2.fillStyle = canvasPattern;
    this.context2.fillRect(0, 0, 400, 350)

    let path2Db = new Path2D()
    path2Db.addPath(this.path2Da, matrix2d)
    this.context2.stroke(path2Db)
  }

  rotateByFunc3() {
    let canvasPattern = this.context3.createPattern(this.img, 'no-repeat');
    let matrix2d = this.createMatrix2D(1, 0, 0, 1, 0, 0).rotate(45 * Math.PI / 180, 100, 0);
    canvasPattern.setTransform(matrix2d);
    this.context3.fillStyle = canvasPattern;
    this.context3.fillRect(0, 0, 400, 350)

    let path2Db = new Path2D()
    path2Db.addPath(this.path2Da, matrix2d)
    this.context3.stroke(path2Db)
  }

  scaleByFunc1() {
    let canvasPattern = this.context.createPattern(this.img, 'no-repeat');
    let matrix2d = this.createMatrix2D(1, 0, 0, 1, 0, 0).scale(1.5);
    canvasPattern.setTransform(matrix2d);
    this.context.fillStyle = canvasPattern;
    this.context.fillRect(0, 0, 400, 350);

    let path2Db = new Path2D()
    path2Db.addPath(this.path2Da, matrix2d)
    this.context.stroke(path2Db)
  }

  scaleByFunc2() {
    let canvasPattern = this.context2.createPattern(this.img, 'no-repeat');
    let matrix2d = this.createMatrix2D(1, 0, 0, 1, 0, 0).scale(1, 1.5);
    canvasPattern.setTransform(matrix2d);
    this.context2.fillStyle = canvasPattern;
    this.context2.fillRect(0, 0, 400, 350)

    let path2Db = new Path2D()
    path2Db.addPath(this.path2Da, matrix2d)
    this.context2.stroke(path2Db)
  }

  scaleByFunc3() {
    let canvasPattern = this.context3.createPattern(this.img, 'no-repeat');
    let matrix2d = this.createMatrix2D(1, 0, 0, 1, 0, 0).scale(1.5, 1.5);
    canvasPattern.setTransform(matrix2d);
    this.context3.fillStyle = canvasPattern;
    this.context3.fillRect(0, 0, 400, 350)

    let path2Db = new Path2D()
    path2Db.addPath(this.path2Da, matrix2d)
    this.context3.stroke(path2Db)
  }

  identity1() {
    let canvasPattern = this.context2.createPattern(this.img, 'no-repeat');
    let matrix2d = this.createMatrix2D(1, 0, 0, 1, 0, 0).scale(1.5, 1.5);

    matrix2d = matrix2d.identity()
    canvasPattern.setTransform(matrix2d);
    this.context2.fillStyle = canvasPattern;
    this.context2.fillRect(0, 0, 400, 350);
    let path2Db = new Path2D()
    path2Db.addPath(this.path2Da, matrix2d)
    this.context2.stroke(path2Db)
  }

  identity2() {
    let canvasPattern = this.context3.createPattern(this.img, 'no-repeat');
    let matrix2d = this.createMatrix2D(1, 0, 0, 1, -75, -75);

    matrix2d = matrix2d.identity()
    canvasPattern.setTransform(matrix2d);
    this.context3.fillStyle = canvasPattern;
    this.context3.fillRect(0, 0, 400, 350);
    let path2Db = new Path2D()
    path2Db.addPath(this.path2Da, matrix2d)
    this.context3.stroke(path2Db)
  }

  identity3() {
    let canvasPattern = this.context6.createPattern(this.img, 'no-repeat');
    let matrix2d = this.createMatrix2D(1.5, 1, 1, 1.5, -75, -75);

    matrix2d = matrix2d.identity()
    canvasPattern.setTransform(matrix2d);
    this.context6.fillStyle = canvasPattern;
    this.context6.fillRect(0, 0, 400, 350);
    let path2Db = new Path2D()
    path2Db.addPath(this.path2Da, matrix2d)
    this.context6.stroke(path2Db)
  }

  invert1() {
    let canvasPattern = this.context2.createPattern(this.img, 'no-repeat');
    let matrix2d = this.createMatrix2D(1, 0, 0, 1, -75, -75);
    canvasPattern.setTransform(matrix2d);
    this.context2.fillStyle = canvasPattern;
    this.context2.fillRect(0, 0, 400, 350)

    let path2Db = new Path2D()
    path2Db.addPath(this.path2Da, matrix2d)
    this.context2.stroke(path2Db)

    matrix2d = matrix2d.invert()
    let canvasPattern2 = this.context2.createPattern(this.img, 'no-repeat');
    canvasPattern2.setTransform(matrix2d);
    this.context2.fillStyle = canvasPattern2;
    this.context2.fillRect(0, 0, 400, 350);
    let path2Dc = new Path2D()
    path2Dc.addPath(this.path2Da, matrix2d)
    this.context2.stroke(path2Dc)
  }

  invert2() {
    let matrix2d = this.createMatrix2D(1, 1, 0, 1, 0, 0)
    matrix2d = matrix2d.invert()
    let canvasPattern = this.context4.createPattern(this.img, 'no-repeat');
    canvasPattern.setTransform(matrix2d);
    this.context4.fillStyle = canvasPattern;
    this.context4.fillRect(0, 0, 400, 350);
    let path2Dc = new Path2D()
    path2Dc.addPath(this.path2Da, matrix2d)
    this.context4.stroke(path2Dc)
  }

  invert3() {
    let canvasPattern = this.context6.createPattern(this.img, 'no-repeat');
    let matrix2d = this.createMatrix2D(1.5, 0, 0, 1, 0, 0)
    matrix2d = matrix2d.invert()
    canvasPattern.setTransform(matrix2d);
    this.context6.fillStyle = canvasPattern;
    this.context6.fillRect(0, 0, 400, 350)

    let path2Db = new Path2D()
    path2Db.addPath(this.path2Da, matrix2d)
    this.context6.stroke(path2Db)
  }
}
