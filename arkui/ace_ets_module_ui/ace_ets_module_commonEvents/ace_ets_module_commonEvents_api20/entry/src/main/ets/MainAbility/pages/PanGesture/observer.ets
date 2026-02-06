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

@Entry
@Component
struct observer{
  @State isOnContent: string = ''
  @State isOffContent: string = 'off'
  @State offsetX: number = 0
  @State offsetY: number = 0
  @State positionX: number = 0
  @State positionY: number = 0
  private panOption: PanGestureOptions = new PanGestureOptions({direction: PanDirection.All })
  aboutToAppear(): void {
    let observer = this.getUIContext().getUIObserver();
    observer.on('beforePanStart', (event: GestureEvent) =>{
      this.isOnContent = String(event.offsetX);
    });
  }
  aboutToDisappear(): void {
    let observer = this.getUIContext().getUIObserver();
    observer.off('beforePanStart', (event: GestureEvent) =>{
      this.isOffContent = String(event.offsetX);
    })
  }

  build() {
    Column(){
      Column(){
        Text('PanGesture :\nX: ' + this.offsetX + '\n' + 'Y: ' + this.offsetY)
          .id('panGesture')
          .gesture(
            PanGesture(this.panOption)
              .onActionStart(() => {
                console.info('Pan gesture started');
              })
              .onActionUpdate((event: GestureEvent) => {
                if (event) {
                  this.offsetX = this.positionX + event.offsetX
                  this.offsetY = this.positionY + event.offsetY
                }
              })
              .onActionEnd((event: GestureEvent) => {
                this.positionX = this.offsetX
                this.positionY = this.offsetY
                console.info('bxq Pan end')
              }))

        Button('Button')
          .id('button')
      }
      .height(200)
      .width(300)
      .padding(20)
      .border({ width: 3 })
      .margin(50)
      .translate({ x: this.offsetX, y: this.offsetY, z: 0 })
      Text(this.isOnContent)
        .id('onContent')
      Text(this.isOffContent)
        .id('offContent')
    }
  }
}