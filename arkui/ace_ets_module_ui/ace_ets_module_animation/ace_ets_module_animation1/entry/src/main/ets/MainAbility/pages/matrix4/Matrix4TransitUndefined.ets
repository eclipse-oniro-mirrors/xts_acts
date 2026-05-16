import { matrix4 } from '@kit.ArkUI';

// matrix1(宽放大2倍) 和 matrix2(宽缩小2倍) 效果相反
let matrix1 = matrix4.identity().scale({ x: 2 });

let matrixTest2 = matrix1.copy().combine(undefined);

let matrixTest3 = matrix1.copy().translate(undefined);

let matrixTest6 = matrix1.copy().scale(undefined);

let matrixTest5 = matrix1.copy().rotate(undefined);

let matrixTest7 = matrix1.copy().transformPoint(undefined);

@Entry
@Component
struct Matrix4TransitUndefined {
  build() {
    Column() {
      // $r("app.media.zh")需要替换为开发者所需的图像资源文件。
      Image($r('app.media.icon'))
        .width(200)
        .height('10%')
        .transform(matrixTest2)
        .margin({ top: 5 })
        .id('combineId')
      // $r("app.media.zh")需要替换为开发者所需的图像资源文件。
      Image($r('app.media.icon'))
        .width(200)
        .height('10%')
        .margin({ top: 5 })
        .transform(matrixTest3)
        .id('translateId')
      Image($r('app.media.icon'))
        .width(200)
        .height('10%')
        .margin({ top: 5 })
        .transform(matrixTest6)
        .id('scaleId')
      Image($r('app.media.icon'))
        .width(200)
        .height('10%')
        .margin({ top: 5 })
        .transform(matrixTest5)
        .id('rotateId')
      Image($r('app.media.icon'))
        .width(200)
        .height('10%')
        .margin({ top: 5 })
        .transform(matrixTest7)
        .id('transformPointId')
    }
  }
}