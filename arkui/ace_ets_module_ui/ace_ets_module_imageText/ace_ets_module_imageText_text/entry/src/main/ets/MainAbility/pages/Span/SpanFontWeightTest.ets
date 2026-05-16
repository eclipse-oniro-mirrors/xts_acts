/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct SpanFontWeightTest {
  build() {
    Scroll(){
      Column() {
        Text(){
          Span('test font no set')
            .fontWeight(400)
            .id('testFontWeightNoSet')
        }
        Text(){
          Span('test font null')
            .fontWeight(null,null)
            .id('testFontWeightNull')
        }
        Text(){
          Span('test font undefined')
            .fontWeight(undefined,undefined)
            .id('testFontWeightUndefined')
        }
        Text(){
          Span('test font ')
            .fontWeight(400,{enableVariableFontWeight:null,enableDeviceFontWeightCategory:null})
            .id('testFontWeightConfigsAllNull')
        }
        Text(){
          Span('test font ')
            .fontWeight(400,{enableVariableFontWeight:undefined,enableDeviceFontWeightCategory:undefined})
            .id('testFontWeightConfigsALLUndefined')
        }
        Text(){
          Span('test font ')
            .fontWeight(600,{
              enableVariableFontWeight:true,
              enableDeviceFontWeightCategory:true
            })
            .id('testFontWeightConfigsALLTrue')
        }
        Text(){
          Span('test font ')
            .fontWeight(600,{
              enableVariableFontWeight:false,
              enableDeviceFontWeightCategory:false
            })
            .id('testFontWeightConfigsALLFalse')
        }
      }.height('100%').width('100%').justifyContent(FlexAlign.Center)
    }
  }
}