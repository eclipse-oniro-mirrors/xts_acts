import { router } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State count: number = 0;
  @State color: number = 0X330000FF;
  @State x:string = 'int'
  @State y:string = 'int'
  @State displayY:string = 'int'
  @State displayX:string = 'int'
  @State windowX:string = 'int'
  @State windowY:string = 'int'
  @State scrollStep:string = 'int'
  @State action:string = 'int'
  @State getVerticalAxisValue:string = 'int'
  @State getHorizontalAxisValue:string = 'int'



  build() {
    Column() {
      Text('Mouse AxisEvent').fontSize(20).width(240).height(80).margin({left:0,top:0}).padding({left:0,top:0}).backgroundColor(Color.Yellow).key('AxisEvent001')
        .onAxisEvent((event) => {
          this.x = event.x+''
          this.y = event.y+''
          this.displayX =event.displayX+''
          this.displayY =event.displayY+''
          this.windowX =event.windowX+''
          this.windowY =event.windowY+''
          this.scrollStep=event.scrollStep+''
          this.action=event.action+''
          this.getVerticalAxisValue=event.getVerticalAxisValue()+''
          this.getHorizontalAxisValue=event.getHorizontalAxisValue()+''
        })
      Text(this.x).key('x')
      Text(this.y).key('y')
      Text(this.displayX).key('displayX')
      Text(this.displayY).key('displayY')
      Text(this.windowX).key('windowX')
      Text(this.windowY).key('windowY')
      Text(this.scrollStep).key('scrollStep')
      Text(this.action).key('action')
      Text(this.getVerticalAxisValue).key('getVerticalAxisValue')
      Text(this.getHorizontalAxisValue).key('getHorizontalAxisValue')

    }
    .alignItems(HorizontalAlign.Start).width('100%').height('100%').key('AxisEvent_Father')
  }
}

