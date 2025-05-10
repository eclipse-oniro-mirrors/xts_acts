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

import render from 'libnativerender.so'
import { CommonView } from '../../componet/CommonView';
import router from '@ohos.router';

class InputEventTestFunctionData {
  public pageTag: string;
  public funcName: string;

  constructor(pageTag: string, funcName: string) {
    this.pageTag = pageTag;
    this.funcName = funcName;
  }
}

class InputEventTestFunctionStaticData {
  public static pageTag: string;
  public static funcName: string;
}


@Entry
@Component
struct InputEventTest {
  private PAGE_TAG: string = (router.getParams() as InputEventTestFunctionData).pageTag;
  private funcName: string = (router.getParams() as InputEventTestFunctionData).funcName;


  build() {
    Column() {
      Button()
        .backgroundColor(Color.Transparent)
        .width(200)
        .height(100)
        .id('mouseButtonCallInputEvent')
        .onClick(() => {
          render.setFuncName(InputEventTestFunctionStaticData.funcName);
        })

      CommonView({
        pageTag: this.PAGE_TAG,
      }).onAppear(() => {
        render.inputEventTest(this.PAGE_TAG,this.funcName);
      })
    }
  }
}

export { InputEventTestFunctionData,InputEventTestFunctionStaticData }