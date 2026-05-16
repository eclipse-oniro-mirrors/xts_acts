/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import window from '@ohos.window';

export class FloatWindowFun {
  static floatingWindowOffsetX: number = 50;
  static floatingWindowOffsetY: number = 500;
  static windowWidth: number = 2560;
  static windowHeight: number = 1600;
  static atWidth: number = 180;
  static title: String = 'start';

  static initAllFun() {
    globalThis.CreateFloatingWindow = (() => {
      window.createWindow({
        ctx: globalThis.abilityContext,
        name: 'sp_floatingWindow',
        windowType: window.WindowType.TYPE_FLOAT
      }).then((floatWin) => {
        floatWin.moveWindowTo(this.floatingWindowOffsetX, this.floatingWindowOffsetY).then(() => {
          floatWin.resize(this.atWidth, this.atWidth).then(() => {
            floatWin.getWindowProperties()
            floatWin.setUIContent('pages/model/FloatBall').then(() => {
              floatWin.setWindowBackgroundColor('#00000000')
            })
          })
        })
      })
    })

    globalThis.MoveFloatingWindow = ((offsetX: number, offsetY: number) => {
      let xx = (this.floatingWindowOffsetX + offsetX * 2) < 0 ? 0 : ((this.floatingWindowOffsetX + offsetX * 2) > (this.windowWidth - 200) ? (this.windowWidth - 200) : (this.floatingWindowOffsetX + offsetX * 2));
      let yy = (this.floatingWindowOffsetY + offsetY * 2) < 0 ? 0 : ((this.floatingWindowOffsetY + offsetY * 2) > (this.windowHeight - 200) ? (this.windowHeight - 200) : (this.floatingWindowOffsetY + offsetY * 2));
      window.findWindow("sp_floatingWindow").moveWindowTo(xx, yy);
    })

    globalThis.DestroyFloatingWindow = (() => {
      window.findWindow('sp_floatingWindow').destroyWindow().then(() => {
        globalThis.showFloatingWindow = false;
      })
    })

    globalThis.SetFloatingWindowPosition = ((offsetX: number, offsetY: number) => {
      this.floatingWindowOffsetX = (this.floatingWindowOffsetX + offsetX * 2) < 0 ? 0 : ((this.floatingWindowOffsetX + offsetX * 2) > (this.windowWidth - 200) ? (this.windowWidth - 200) : (this.floatingWindowOffsetX + offsetX * 2));
      this.floatingWindowOffsetY = (this.floatingWindowOffsetY + offsetY * 2) < 0 ? 0 : ((this.floatingWindowOffsetY + offsetY * 2) > (this.windowHeight - 200) ? (this.windowHeight - 200) : (this.floatingWindowOffsetY + offsetY * 2));
    })

    globalThis.HideFloatingWindow = (() => {
      window.findWindow("sp_floatingWindow").hide().then(() => {
        globalThis.showFloatingWindow = false;
      })
    })

    globalThis.ShowFloatingWindow = (() => {
      window.findWindow("sp_floatingWindow").showWindow().then(() => {
        globalThis.title = this.title;
      })
    })
  }
}