/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
struct PanGestureExample03 {
  @State repeat: string = 'init'
  @State angle: string = 'init'
  @State scale1: string = 'init'
  @State pinchCenterX: string = 'init'
  @State pinchCenterY: string = 'init'
  @State speed: string = 'init'
  @State fingerList_id: string = 'init'
  @State fingerList_globalX: string = 'init'
  @State fingerList_globalY: string = 'init'
  @State fingerList_localX: string = 'init'
  @State fingerList_localY: string = 'init'
  @State fingerList_displayX: string = 'init'
  @State fingerList_displayY: string = 'init'
  @State fingerListLength: number = -1
  @State fingerList1_id: string = 'init'
  @State fingerList1_globalX: string = 'init'
  @State fingerList1_globalY: string = 'init'
  @State fingerList1_localX: string = 'init'
  @State fingerList1_localY: string = 'init'
  @State fingerList1_displayX: string = 'init'
  @State fingerList1_displayY: string = 'init'
  @State target_area_width: string = 'init'
  @State target_area_height: string = 'init'
  @State target_area_position_x: string = 'init'
  @State target_area_position_y: string = 'init'
  @State target_area_globalPosition_x: string = 'init'
  @State target_area_globalPosition_y: string = 'init'
  @State source: string = 'init'
  @State pressure: string = 'init'
  @State tiltX: string = 'init'
  @State tiltY: string = 'init'
  @State sourceTool: string = 'init'
  @State velocityX: string = 'init'
  @State velocityY: string = 'init'
  @State velocity: string = 'init'
  @State offsetX: number = 0
  @State offsetY: number = 0

  @State time: number = 0
  @State timestamp: number = 0
  private panOption: PanGestureOptions = new PanGestureOptions({ direction: PanDirection.Left | PanDirection.Right | PanDirection.All | PanDirection.Horizontal | PanDirection.Vertical})
  build() {
    Column({space:10}) {
      Text('PanGesture03').fontSize(20).width(160).height(80).margin({left:0,top:0}).padding({left:0,top:0}).backgroundColor(Color.Yellow).key('PanGestureExample03_Click')
        .translate({ x: this.offsetX, y: this.offsetY, z: 0 })
        .gesture(
          PanGesture(this.panOption)
            .onActionStart((event: GestureEvent) => {
              if (event) {
                this.time = Date.now()
                this.timestamp = event.timestamp
                this.repeat = event.repeat + ''
                this.offsetX = event.offsetX
                this.offsetY = event.offsetY
                this.angle = event.angle + ''
                this.scale1 = event.scale + ''
                this.pinchCenterX = event.pinchCenterX + ''
                this.pinchCenterY = event.pinchCenterY + ''
                this.speed = event.speed + ''

                // 测试fingerList
                // 第一根手指的
                if (event.fingerList[0] && event.fingerList[0] !== undefined) {
                  this.fingerList_id = event.fingerList[0].id + ''
                  this.fingerList_globalX = event.fingerList[0].globalX + ''
                  this.fingerList_globalY = event.fingerList[0].globalY + ''
                  this.fingerList_localX = event.fingerList[0].localX + ''
                  this.fingerList_localY = event.fingerList[0].localY + ''
                  this.fingerList_displayX = event.fingerList[0].displayX + ''
                  this.fingerList_displayY = event.fingerList[0].displayY + ''
                }
                this.fingerListLength = event.fingerList.length
                if (event.fingerList[1] && event.fingerList[1] !== undefined) {
                  // 第二根手指的
                  this.fingerList1_id = event.fingerList[1].id + ''
                  this.fingerList1_globalX = event.fingerList[1].globalX + ''
                  this.fingerList1_globalY = event.fingerList[1].globalY + ''
                  this.fingerList1_localX = event.fingerList[1].localX + ''
                  this.fingerList1_localY = event.fingerList[1].localY + ''
                  this.fingerList1_displayX = event.fingerList[1].displayX + ''
                  this.fingerList1_displayY = event.fingerList[1].displayY + ''
                }
                // 测试target
                this.target_area_width = event.target.area.width + ''
                this.target_area_height = event.target.area.height + ''
                this.target_area_position_x = event.target.area.position.x + ''
                this.target_area_position_y = event.target.area.position.y + ''
                this.target_area_globalPosition_x = event.target.area.globalPosition.x + ''
                this.target_area_globalPosition_y = event.target.area.globalPosition.y + ''

                this.source = event.source + ''
                this.pressure = event.pressure + ''
                this.tiltX = event.tiltX + ''
                this.tiltY = event.tiltY + ''
                this.sourceTool = SourceTool[event.sourceTool] + ''
                this.velocityX = event.velocityX + ''
                this.velocityY = event.velocityY + ''
                this.velocity = event.velocity + ''
              }
            })
            .onActionUpdate((event: GestureEvent) => {
              if (event) {
                this.time = Date.now()
                this.timestamp = event.timestamp
                this.repeat = event.repeat + ''
                this.offsetX = event.offsetX
                this.offsetY = event.offsetY
                this.angle = event.angle + ''
                this.scale1 = event.scale + ''
                this.pinchCenterX = event.pinchCenterX + ''
                this.pinchCenterY = event.pinchCenterY + ''
                this.speed = event.speed + ''

                // 测试fingerList
                // 第一根手指的
                if (event.fingerList[0] && event.fingerList[0] !== undefined) {
                  this.fingerList_id = event.fingerList[0].id + ''
                  this.fingerList_globalX = event.fingerList[0].globalX + ''
                  this.fingerList_globalY = event.fingerList[0].globalY + ''
                  this.fingerList_localX = event.fingerList[0].localX + ''
                  this.fingerList_localY = event.fingerList[0].localY + ''
                  this.fingerList_displayX = event.fingerList[0].displayX + ''
                  this.fingerList_displayY = event.fingerList[0].displayY + ''
                }
                this.fingerListLength = event.fingerList.length
                if (event.fingerList[1] && event.fingerList[1] !== undefined) {
                  // 第二根手指的
                  this.fingerList1_id = event.fingerList[1].id + ''
                  this.fingerList1_globalX = event.fingerList[1].globalX + ''
                  this.fingerList1_globalY = event.fingerList[1].globalY + ''
                  this.fingerList1_localX = event.fingerList[1].localX + ''
                  this.fingerList1_localY = event.fingerList[1].localY + ''
                  this.fingerList1_displayX = event.fingerList[1].displayX + ''
                  this.fingerList1_displayY = event.fingerList[1].displayY + ''
                }
                // 测试target
                this.target_area_width = event.target.area.width + ''
                this.target_area_height = event.target.area.height + ''
                this.target_area_position_x = event.target.area.position.x + ''
                this.target_area_position_y = event.target.area.position.y + ''
                this.target_area_globalPosition_x = event.target.area.globalPosition.x + ''
                this.target_area_globalPosition_y = event.target.area.globalPosition.y + ''

                this.source = event.source + ''
                this.pressure = event.pressure + ''
                this.tiltX = event.tiltX + ''
                this.tiltY = event.tiltY + ''
                this.sourceTool = SourceTool[event.sourceTool] + ''
                this.velocityX = event.velocityX + ''
                this.velocityY = event.velocityY + ''
                this.velocity = event.velocity + ''
              }
            })
            .onActionEnd((event: GestureEvent) => {
              if (event) {
                this.time = Date.now()
                this.timestamp = event.timestamp
                this.repeat = event.repeat + ''
                this.offsetX = event.offsetX
                this.offsetY = event.offsetY
                this.angle = event.angle + ''
                this.scale1 = event.scale + ''
                this.pinchCenterX = event.pinchCenterX + ''
                this.pinchCenterY = event.pinchCenterY + ''
                this.speed = event.speed + ''
                // 测试fingerList
                // 第一根手指的
                if (event.fingerList[0] && event.fingerList[0] !== undefined) {
                  this.fingerList_id = event.fingerList[0].id + ''
                  this.fingerList_globalX = event.fingerList[0].globalX + ''
                  this.fingerList_globalY = event.fingerList[0].globalY + ''
                  this.fingerList_localX = event.fingerList[0].localX + ''
                  this.fingerList_localY = event.fingerList[0].localY + ''
                  this.fingerList_displayX = event.fingerList[0].displayX + ''
                  this.fingerList_displayY = event.fingerList[0].displayY + ''
                }
                this.fingerListLength = event.fingerList.length
                if (event.fingerList[1] && event.fingerList[1] !== undefined) {
                  // 第二根手指的
                  this.fingerList1_id = event.fingerList[1].id + ''
                  this.fingerList1_globalX = event.fingerList[1].globalX + ''
                  this.fingerList1_globalY = event.fingerList[1].globalY + ''
                  this.fingerList1_localX = event.fingerList[1].localX + ''
                  this.fingerList1_localY = event.fingerList[1].localY + ''
                  this.fingerList1_displayX = event.fingerList[1].displayX + ''
                  this.fingerList1_displayY = event.fingerList[1].displayY + ''
                }
                // 测试target
                this.target_area_width = event.target.area.width + ''
                this.target_area_height = event.target.area.height + ''
                this.target_area_position_x = event.target.area.position.x + ''
                this.target_area_position_y = event.target.area.position.y + ''
                this.target_area_globalPosition_x = event.target.area.globalPosition.x + ''
                this.target_area_globalPosition_y = event.target.area.globalPosition.y + ''

                this.source = event.source + ''
                this.pressure = event.pressure + ''
                this.tiltX = event.tiltX + ''
                this.tiltY = event.tiltY + ''
                this.sourceTool = SourceTool[event.sourceTool] + ''
                this.velocityX = event.velocityX + ''
                this.velocityY = event.velocityY + ''
                this.velocity = event.velocity + ''
              }
            })
        )

      Text(`repeat:${this.repeat}`).key('PanGestureExample03_repeat')
      Text(`${this.offsetX}`).key('PanGestureExample03_offsetX')
      Text(`${this.offsetY}`).key('PanGestureExample03_offsetY')
      Text(`angle:${this.angle}`).key('PanGestureExample03_angle')
      Text(`scale:${this.scale1}`).key('PanGestureExample03_scale')
      Text(`pinchCenterX:${this.pinchCenterX}`).key('PanGestureExample03_pinchCenterX')
      Text(`pinchCenterY:${this.pinchCenterY}`).key('PanGestureExample03_pinchCenterY')
      Text(`speed:${this.speed}`).key('PanGestureExample03_speed')

      Text(){
        Span(`fingerList_id:${this.fingerList_id}`).fontColor(Color.Blue).key('PanGestureExample03_fingerList_id')
        Span(`${this.fingerList_globalX}`).fontColor(Color.Red).key('PanGestureExample03_fingerList_globalX')
        Span(`${this.fingerList_globalY}`).fontColor(Color.Green).key('PanGestureExample03_fingerList_globalY')
        Span(`${this.fingerList_localX}`).fontColor(Color.Orange).key('PanGestureExample03_fingerList_localX')
        Span(`${this.fingerList_localY}`).fontColor(Color.Brown).key('PanGestureExample03_fingerList_localY')
        Span(`${this.fingerList_displayX}`).fontColor(Color.Pink).key('PanGestureExample03_fingerList_displayX')
        Span(`${this.fingerList_displayY}`).fontColor(Color.Red).key('PanGestureExample03_fingerList_displayY')
      }
      Text(`length:${this.fingerListLength}`).fontColor(Color.Blue).key('PanGestureExample03_fingerList_length')
      Text(){
        Span(`fingerList1_id:${this.fingerList1_id}`).fontColor(Color.Blue).key('PanGestureExample03_fingerList1_id')
        Span(`${this.fingerList1_globalX}`).fontColor(Color.Red).key('PanGestureExample03_fingerList1_globalX')
        Span(`${this.fingerList1_globalY}`).fontColor(Color.Green).key('PanGestureExample03_fingerList1_globalY')
        Span(`${this.fingerList1_localX}`).fontColor(Color.Orange).key('PanGestureExample03_fingerList1_localX')
        Span(`${this.fingerList1_localY}`).fontColor(Color.Brown).key('PanGestureExample03_fingerList1_localY')
        Span(`${this.fingerList1_displayX}`).fontColor(Color.Pink).key('PanGestureExample03_fingerList1_displayX')
        Span(`${this.fingerList1_displayY}`).fontColor(Color.Red).key('PanGestureExample03_fingerList1_displayY')
      }

      Text(){
        Span(`${this.timestamp}`).fontColor(Color.Blue).key('PanGestureExample03_timestamp')
        Span(`${this.time}`).fontColor(Color.Red).key('PanGestureExample03_time')
      }
      Text(){
        Span(`${this.target_area_width}`).fontColor(Color.Green).key('PanGestureExample03_target_area_width')
        Span(`${this.target_area_height}`).fontColor(Color.Red).key('PanGestureExample03_target_area_height')
        Span(`${this.target_area_position_x}`).fontColor(Color.Green).key('PanGestureExample03_target_area_position_x')
        Span(`${this.target_area_position_y}`).fontColor(Color.Red).key('PanGestureExample03_target_area_position_y')
        Span(`${this.target_area_globalPosition_x}`).fontColor(Color.Green).key('PanGestureExample03_target_area_globalPosition_x')
        Span(`${this.target_area_globalPosition_y}`).fontColor(Color.Red).key('PanGestureExample03_target_area_globalPosition_y')
      }

      Text(`source:${this.source}`).key('PanGestureExample03_source')
      Text(`pressure:${this.pressure}`).key('PanGestureExample03_pressure')
      Text(`tiltX:${this.tiltX}`).key('PanGestureExample03_tiltX')
      Text(`tiltY:${this.tiltY}`).key('PanGestureExample03_tiltY')
      Text(`sourceTool:${this.sourceTool}`).key('PanGestureExample03_sourceTool')
      Text(`velocityX:${this.velocityX}`).key('PanGestureExample03_velocityX')
      Text(`velocityY:${this.velocityY}`).key('PanGestureExample03_velocityY')
      Text(`velocity:${this.velocity}`).key('PanGestureExample03_velocity')

    }.alignItems(HorizontalAlign.Start).width('100%').height('100%').backgroundColor('#ffbebaba').key('PanGestureExample03_Father')
  }
}