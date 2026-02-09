/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import nativeNode from 'libnativerender.so';
import { NodeContent } from '@kit.ArkUI';

@Entry
@Component
struct XComponentKeyMouseEventPage {
  private nodeContent: NodeContent = new NodeContent();
  @State keyStr: string = '-';
  @State indicatorStr: string = '-';
  @State mouseStr: string = '-'

  aboutToAppear():void{
    nativeNode.CreateKeyMouseEventNativeRoot(this.nodeContent, 'ygb');

    let timer = setInterval(()=>{
      this.keyStr = nativeNode.getKeyStr()
      this.indicatorStr = nativeNode.getIndicatorStr()
      this.mouseStr = nativeNode.getMouseStr()
    }, 1000.0/60.0)
  }

  build() {
      Column() {
        Row() {
          ContentSlot(this.nodeContent)
        }
        .width('90%')
        .height('70%')

        Text(this.keyStr).key('XComponentKeyMouseEventPage_KeyStr')
        Text(this.mouseStr).key('XComponentKeyMouseEventPage_MouseStr')
        Text(this.indicatorStr).key('XComponentKeyMouseEventPage_IndicatorStr')
      }.height('100%')
  }
}