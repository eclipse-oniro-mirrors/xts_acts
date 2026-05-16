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
import { Entry, Component, Column, Button, Text, TransitionEffect } from '@ohos.arkui.component';
import { FrameNode } from '@ohos.arkui.node';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct TransitionEffectIndex {
  @State identityStatus: string = 'init';
  @State slideStatus: string = 'init';
  @State slideSwitchStatus: string = 'init';

  private hasComponentInfo(): boolean {
    try {
      let rootNode: FrameNode | null = this.getUIContext().getFrameNodeByUniqueId(this.getUniqueId());
      let firstChildNode: FrameNode | null = rootNode?.getFirstChild() ?? null;
      return firstChildNode !== null;
    } catch (error) {
      return false;
    }
  }

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('TransitionEffectIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Column() {
      Button('IDENTITY').id('transitionIdentityBtn').height('8%').onClick(() => {
        try {
          let identity: TransitionEffect = TransitionEffect.IDENTITY;
          this.identityStatus = this.hasComponentInfo() && identity !== undefined ? 'identity_ok' : 'identity_fail';
        } catch (error) {
          this.identityStatus = 'identity_fail';
        }
      });
      Text(this.identityStatus).key('transitionIdentityStatus').height('5%');

      Button('SLIDE').id('transitionSlideBtn').height('8%').onClick(() => {
        try {
          let slide: TransitionEffect = TransitionEffect.SLIDE;
          this.slideStatus = this.hasComponentInfo() && slide !== undefined ? 'slide_ok' : 'slide_fail';
        } catch (error) {
          this.slideStatus = 'slide_fail';
        }
      });
      Text(this.slideStatus).key('transitionSlideStatus').height('5%');

      Button('SLIDE_SWITCH').id('transitionSlideSwitchBtn').height('8%').onClick(() => {
        try {
          let slideSwitch: TransitionEffect = TransitionEffect.SLIDE_SWITCH;
          this.slideSwitchStatus = this.hasComponentInfo() && slideSwitch !== undefined ? 'slideSwitch_ok' : 'slideSwitch_fail';
        } catch (error) {
          this.slideSwitchStatus = 'slideSwitch_fail';
        }
      });
      Text(this.slideSwitchStatus).key('transitionSlideSwitchStatus').height('5%');
    }
    .width('100%')
    .height('100%');
  }
}
