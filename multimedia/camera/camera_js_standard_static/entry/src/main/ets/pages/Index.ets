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
import { Entry, Text, TextAttribute, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import hilog from '@ohos.hilog'
import { XComponentOptions, XComponentController, XComponent } from 'arkui.component.xcomponent'
import { XComponentType } from 'arkui.component.enums';
import { Hypium } from "../../../hypium/index";

class MyController extends XComponentController {
  onSurfaceCreated(surfaceId: string): void {
    console.info(TAG + 'XComponent onSurfaceCreated is called')
    if (!isSurfaceCreated) {
      isSurfaceCreated = true;
      surfaceIds = surfaceId;
      console.info(TAG + 'onSurfaceCreated XComponent surfaceIds: ' + surfaceIds)
      Hypium.set('SurfaceId', surfaceIds);
    } else {
      console.info(TAG + 'surfaceIds has been created: ' + surfaceIds)
    }
  }
}

let TAG = 'CameraModuleTest: ';
let surfaceIds: string;
let isSurfaceCreated: boolean = false;
let mXComponentController: MyController = new MyController();

@Entry
@Component
struct MyStateSample {

  aboutToAppear() {
    console.info('  --------------aboutToAppear--------------')
  }
  @State stateVar: string = 'state var';
  message: string = 'var';
  changeValue() {
    this.stateVar+='~'
  }
  build() {
    Column(undefined) {
      Text('Hello World').fontSize(20)
      Button(this.message).backgroundColor('#FFFF00FF')
        .onClick((e: ClickEvent) => {
          hilog.info(0x0000, 'testTag', 'On Click');
          this.changeValue();
        })
      Text(this.stateVar).fontSize(20)
      Child({stateVar: this.stateVar} as __Options_Child)
      XComponent({
        type: XComponentType.SURFACE,
        controller: mXComponentController
      } as XComponentOptions)
      .onLoad(() => {
        console.info(TAG + 'XComponent onLoad is called')
        if (!isSurfaceCreated) {
          isSurfaceCreated = true;
          surfaceIds = mXComponentController.getXComponentSurfaceId();
          console.info(TAG + 'XComponent onLoad surfaceIds: ' + surfaceIds)
          Hypium.set('SurfaceId', surfaceIds);
        } else {
          console.info(TAG + 'XComponent: surfaceIds has been created: ' + surfaceIds)
        }
      })
        .width('1920px')
        .height('1080px')
    }
  }
}

@Component
struct Child {
  @State stateVar: string = 'Child';
  build() {
    Text(this.stateVar).fontSize(50)
  }
}
