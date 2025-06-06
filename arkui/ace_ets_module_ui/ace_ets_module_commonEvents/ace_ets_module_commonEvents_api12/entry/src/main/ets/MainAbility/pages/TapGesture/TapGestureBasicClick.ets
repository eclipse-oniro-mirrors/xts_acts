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
struct TapGestureBasicClick {
  @State repeat: string = 'init'
  @State offsetX: string = 'init'
  @State offsetY: string = 'init'
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
  @State time: number = 0
  @State timestamp: number = 0
  build() {
    Column({space:10}) {
      Text('Click').fontSize(20).width(240).height(80).margin({left:0,top:0}).padding({left:0,top:0}).backgroundColor(Color.Yellow).key('TapGestureBasicClick_Click')
        .gesture(
          TapGesture({ count: 1 })
            .onAction((event: GestureEvent) => {
              if (event) {
                this.time = Date.now()
                this.timestamp = event.timestamp
                this.repeat = event.repeat + ''
                this.offsetX = event.offsetX + ''
                this.offsetY = event.offsetY + ''
                this.angle = event.angle + ''
                this.scale1 = event.scale + ''
                this.pinchCenterX = event.pinchCenterX + ''
                this.pinchCenterY = event.pinchCenterY + ''
                this.speed = event.speed + ''
                this.fingerList_id = event.fingerList[0].id + ''
                this.fingerList_globalX = event.fingerList[0].globalX + ''
                this.fingerList_globalY = event.fingerList[0].globalY + ''
                this.fingerList_localX = event.fingerList[0].localX + ''
                this.fingerList_localY = event.fingerList[0].localY + ''
                this.fingerList_displayX = event.fingerList[0].displayX + ''
                this.fingerList_displayY = event.fingerList[0].displayY + ''
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

      Text(`repeat:${this.repeat}`).key('TapGestureBasicClick_repeat')
      Text(`offsetX:${this.offsetX}`).key('TapGestureBasicClick_offsetX')
      Text(`offsetY:${this.offsetY}`).key('TapGestureBasicClick_offsetY')
      Text(`angle:${this.angle}`).key('TapGestureBasicClick_angle')
      Text(`scale:${this.scale1}`).key('TapGestureBasicClick_scale')
      Text(`pinchCenterX:${this.pinchCenterX}`).key('TapGestureBasicClick_pinchCenterX')
      Text(`pinchCenterY:${this.pinchCenterY}`).key('TapGestureBasicClick_pinchCenterY')
      Text(`speed:${this.speed}`).key('TapGestureBasicClick_speed')

      Text(){
        Span(`fingerList_id:${this.fingerList_id}`).fontColor(Color.Blue).key('TapGestureBasicClick_fingerList_id')
        Span(`${this.fingerList_globalX}`).fontColor(Color.Red).key('TapGestureBasicClick_fingerList_globalX')
        Span(`${this.fingerList_globalY}`).fontColor(Color.Green).key('TapGestureBasicClick_fingerList_globalY')
        Span(`${this.fingerList_localX}`).fontColor(Color.Orange).key('TapGestureBasicClick_fingerList_localX')
        Span(`${this.fingerList_localY}`).fontColor(Color.Brown).key('TapGestureBasicClick_fingerList_localY')
        Span(`${this.fingerList_displayX}`).fontColor(Color.Pink).key('TapGestureBasicClick_fingerList_displayX')
        Span(`${this.fingerList_displayY}`).fontColor(Color.Red).key('TapGestureBasicClick_fingerList_displayY')
      }

      Text(){
        Span(`${this.timestamp}`).fontColor(Color.Blue).key('TapGestureBasicClick_timestamp')
        Span(`${this.time}`).fontColor(Color.Red).key('TapGestureBasicClick_time')
      }
      Text(){
        Span(`${this.target_area_width}`).fontColor(Color.Green).key('TapGestureBasicClick_target_area_width')
        Span(`${this.target_area_height}`).fontColor(Color.Red).key('TapGestureBasicClick_target_area_height')
        Span(`${this.target_area_position_x}`).fontColor(Color.Green).key('TapGestureBasicClick_target_area_position_x')
        Span(`${this.target_area_position_y}`).fontColor(Color.Red).key('TapGestureBasicClick_target_area_position_y')
        Span(`${this.target_area_globalPosition_x}`).fontColor(Color.Green).key('TapGestureBasicClick_target_area_globalPosition_x')
        Span(`${this.target_area_globalPosition_y}`).fontColor(Color.Red).key('TapGestureBasicClick_target_area_globalPosition_y')
      }

      Text(`source:${this.source}`).key('TapGestureBasicClick_source')
      Text(`pressure:${this.pressure}`).key('TapGestureBasicClick_pressure')
      Text(`tiltX:${this.tiltX}`).key('TapGestureBasicClick_tiltX')
      Text(`tiltY:${this.tiltY}`).key('TapGestureBasicClick_tiltY')
      Text(`sourceTool:${this.sourceTool}`).key('TapGestureBasicClick_sourceTool')
      Text(`velocityX:${this.velocityX}`).key('TapGestureBasicClick_velocityX')
      Text(`velocityY:${this.velocityY}`).key('TapGestureBasicClick_velocityY')
      Text(`velocity:${this.velocity}`).key('TapGestureBasicClick_velocity')

    }.alignItems(HorizontalAlign.Start).width('100%').height('100%').backgroundColor('#ffbebaba').key('TapGestureBasicClick_Father')
  }
}