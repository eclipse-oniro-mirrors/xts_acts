'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { Entry, Component, Column, Text, Image, $r } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { AnimationStopMode, AnimationOptions } from '@ohos.arkui.drawableDescriptor';

@Entry
@Component
struct DrawableDescriptorIndex {
  @State firstFrameVal: string = '';
  @State lastFrameVal: string = '';
  @State optsInfo: string = '';

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) { console.info('[ARKUI_NEW] DrawableDescriptorIndex error ' + error); }

    this.firstFrameVal = 'FIRST_FRAME=' + AnimationStopMode.FIRST_FRAME;
    this.lastFrameVal = 'LAST_FRAME=' + AnimationStopMode.LAST_FRAME;

    let opts1: AnimationOptions = { stopMode: AnimationStopMode.FIRST_FRAME };
    let opts2: AnimationOptions = { stopMode: AnimationStopMode.LAST_FRAME };
    let opts3: AnimationOptions = {};
    this.optsInfo = 'opts1=' + opts1.stopMode + ',opts2=' + opts2.stopMode + ',opts3=' + opts3.stopMode;

    AppStorage.setOrCreate<string>('animStopModeFirst', String(AnimationStopMode.FIRST_FRAME));
    AppStorage.setOrCreate<string>('animStopModeLast', String(AnimationStopMode.LAST_FRAME));
    AppStorage.setOrCreate<string>('animOptsInfo', this.optsInfo);
  }

  build() {
    Column() {
      Text('DrawableDescriptor Test').key('ddRoot').id('ddRoot').fontSize(20)
      Text(this.firstFrameVal).key('ddFirstFrame').id('ddFirstFrame').fontSize(14)
      Text(this.lastFrameVal).key('ddLastFrame').id('ddLastFrame').fontSize(14)
      Text(this.optsInfo).key('ddOptsInfo').id('ddOptsInfo').fontSize(14)

      Image($r('app.media.icon')).key('ddImage1').id('ddImage1').width(60).height(60)
      Image($r('app.media.icon')).key('ddImage2').id('ddImage2').width(60).height(60)
    }.width('100%').height('100%').padding(16)
  }
}
