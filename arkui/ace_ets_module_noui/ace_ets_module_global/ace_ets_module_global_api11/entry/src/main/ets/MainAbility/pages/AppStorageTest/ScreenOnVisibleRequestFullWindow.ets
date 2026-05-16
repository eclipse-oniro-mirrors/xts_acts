/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import app, { ScreenOnVisibleOptions } from '@system.app';

@Entry
@Component
struct ScreenOnVisibleNullIndex {

  build() {
    Column() {
      Button('screenOnVisible')
        .id('btn_screenOnVisible_id')
        .height('10%')
        .onClick(() => {
          let visible: ScreenOnVisibleOptions = {
            visible: false
          };

          try{
            app.screenOnVisible(visible);
            console.log('screenOnVisible false success');
            AppStorage.SetOrCreate('ScreenOnVisibleFalse', 'success');
          }  catch (e) {
            console.log('screenOnVisible false error: ' + e);
            AppStorage.SetOrCreate('ScreenOnVisibleFalse', 'fail');
          }

          try{
            app.screenOnVisible(null);
            console.log('screenOnVisible null success');
            AppStorage.SetOrCreate('screenOnVisibleNull', 'success');
          }  catch (e) {
            console.log('screenOnVisible null error: ' + e);
            AppStorage.SetOrCreate('screenOnVisibleNull', 'fail');
          }

          try{
            app.screenOnVisible(undefined);
            console.log('screenOnVisible undefined success');
            AppStorage.SetOrCreate('screenOnVisibleUndefined', 'success');
          }  catch (e) {
            console.log('screenOnVisible undefined error: ' + e);
            AppStorage.SetOrCreate('screenOnVisibleUndefined', 'fail');
          }
        })

      Button('requestFullWindow')
        .id('btn_requestFullWindow_id')
        .height('10%')
        .onClick(() => {
          try{
            app.requestFullWindow(null);
            console.log('requestFullWindow null success');
            AppStorage.SetOrCreate('requestFullWindowNull', 'success');
          }  catch (e) {
            console.log('requestFullWindow null error: ' + e);
            AppStorage.SetOrCreate('requestFullWindowNull', 'fail');
          }

          try{
            app.requestFullWindow(undefined);
            console.log('requestFullWindow undefined success');
            AppStorage.SetOrCreate('requestFullWindowUndefined', 'success');
          }  catch (e) {
            console.log('requestFullWindow undefined error: ' + e);
            AppStorage.SetOrCreate('requestFullWindowUndefined', 'fail');
          }
        })
    }
    .width('100%')
    .height('100%')
  }
}
