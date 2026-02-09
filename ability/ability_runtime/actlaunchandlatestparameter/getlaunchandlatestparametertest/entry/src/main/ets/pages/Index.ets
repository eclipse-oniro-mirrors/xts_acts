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
import testNapi from 'libentry.so';
@Entry
@Component
struct Index {
  @State message1: string = 'GetLaunchParameter';
  @State message2: string = 'GetLatestParameter';
  @State result:string = '';

  build() {
      Column({space: 20 }) {
        Text(this.result).fontSize(20)
        Column({space:15}) {
          Button(this.message1)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              this.result = testNapi.getLaunchParameter();
              console.info("GetLaunchParameter:" + this.result)
              this.result = "GetLaunchParameter: \n" + this.result;
            })
          Button(this.message2)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              this.result = testNapi.getLatestParameter();
              console.info("GetLatestParameter:" + this.result)
              this.result = "GetLatestParameter: \n" + this.result;
            })
        }.height('20%')

        Text("GetLaunchParameter接口异常参数测试").fontColor(Color.Red).fontSize(30)
        Column({space:15}) {
          Button("writeLength为空指针")
            .fontSize(20)
            .onClick(() => {
              this.result = testNapi.Error_GetLaunchParameter_writelength_null();
              this.result = "GetLaunchParameter writeLength nullptr: \n" + this.result;
              console.log('GetLaunchParameter writeLength nullptr:'+ this.result)
            })

          Button("写入buffer空间不足")
            .fontSize(20)
            .onClick(() => {
              this.result = testNapi.Error_GetLaunchParameter_buffersize_less();
              this.result = "GetLaunchParameter insufficient buffer: \n" + this.result;
            })

          Button("写入buffer为空指针")
            .fontSize(20)
            .onClick(() => {
              this.result = testNapi.Error_GetLaunchParameter_buffer_null();
              this.result = "GetLaunchParameter null buffer: \n" + this.result;
            })
        }.height('30%')

        Text("GetLatestParameter接口异常参数测试").fontColor(Color.Red).fontSize(30)
        Column({space: 15}) {
          Button("writeLength为空指针")
            .fontSize(20)
            .onClick(() => {
              this.result = testNapi.Error_GetLatestParameter_buffer_null();
              this.result = "GetLatestParameter writeLength nullptr: \n" + this.result;
            })

          Button("写入buffer空间不足")
            .fontSize(20)
            .onClick(() => {
              this.result = testNapi.Error_GetLaunchParameter_buffersize_less();
              this.result = "GetLatestParameter insufficient buffer: \n" + this.result;
            })

          Button("写入buffer为空指针")
            .fontSize(20)
            .onClick(() => {
              this.result = testNapi.Error_GetLaunchParameter_buffer_null();
              this.result = "GetLatestParameter buffer nullptr: \n" + this.result;
            })
        }.height('30%')
      }
      .width('100%').height('90%')
  }
}
