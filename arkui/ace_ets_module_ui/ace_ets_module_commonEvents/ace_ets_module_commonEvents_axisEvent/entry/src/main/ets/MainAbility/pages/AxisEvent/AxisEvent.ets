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
  @State propagationValue:string = 'int'
  @State None:string = '123'
  @State Begin:string = '123'
  @State UPDATE:string = '123'
  @State END:string = '123'
  @State Cancel:string = '123'
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
          this.propagationValue=event.propagation()+''
          if (event.action==AxisAction.NONE){
            console.log("NONE");
            this.None = "NONE"
          }
          else console.log("error");
          if (event.action==AxisAction.BEGIN){
            console.log("BEGIN ");
            this.Begin = "BEGIN"
          }
          else console.log("error");
          if (event.action==AxisAction.UPDATE){
            console.log("UPDATE ");
            this.UPDATE= "UPDATE"
          }
          else console.log("error");
          if (event.action==AxisAction.END){
            console.log("END ");
            this.END="END"
          }
          else console.log("error");
          if (event.action==AxisAction.CANCEL){
            console.log("CANCEL  ");
            this.Cancel="CANCEL"
          }
          else console.log("error");
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
      Text(this.propagationValue).key('propagationValue')
      Text(this.None).key('None')
      Text(this.Begin).key('Begin')
      Text(this.UPDATE).key('UPDATE')
      Text(this.END).key('END')
      Text(this.Cancel).key('Cancel')
    }
    .alignItems(HorizontalAlign.Start).width('100%').height('100%').key('AxisEvent_Father')
  }
}