/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
 
import userAuth from '@ohos.userIAM.userAuth';
import { UserAuthIcon } from '@ohos.userIAM.userAuthIcon';

import { Entry, Text, TextAttribute, Column, Component, Button, ClickEvent, Row, Color} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'

@Entry
@Component
struct Index {
  @State result: string = '******';
  authParam: userAuth.AuthParam = {
    challenge: new Uint8Array([49, 49, 49, 49, 49, 49]),
    authType: [userAuth.UserAuthType.FACE],
    authTrustLevel: userAuth.AuthTrustLevel.ATL1,
  } as userAuth.AuthParam;
  widgetParam: userAuth.WidgetParam = {
    title: '请进行身份认证',
  } as userAuth.WidgetParam;

  build() {
    Row() {
      Column() {
        UserAuthIcon({
          authParam: this.authParam,
          widgetParam: this.widgetParam,
          iconHeight: 64,
          iconColor: Color.Blue,
          onIconClick: () => {
		        hilog.info(0x0000, 'testTag', 'The user clicked the icon');
          },
          onAuthResult: (result: userAuth.UserAuthResult) => {
		        hilog.info(0x0000, 'testTag', 'Get user auth result, result = ' + JSON.stringify(result));
            this.result = result.result.toString()
          },
        })
        Text("result_code")
        Text(this.result)
      }
    }
  }
}


