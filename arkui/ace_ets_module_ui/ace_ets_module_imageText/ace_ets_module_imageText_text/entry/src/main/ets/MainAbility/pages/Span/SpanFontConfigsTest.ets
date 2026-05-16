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
struct SpanFontConfigsTest {
  build() {
    Scroll(){
      Column() {
        Text(){
          Span('test font no set')
            .font({size:10,weight:400})
            .id('testFontNoSet')
        }
        Text(){
          Span('test font null')
            .font(null,null)
            .id('testFontNull')
        }
        Text(){
          Span('test font undefined')
            .font(undefined,undefined)
            .id('testFontUndefined')
        }
        Text(){
          Span('test font ')
            .font({size:20,weight:400},{fontWeightConfigs:null})
            .id('testFontConfigsNull')
        }
        Text(){
          Span('test font ')
            .font({size:20,weight:400},{fontWeightConfigs:undefined})
            .id('testFontConfigsUndefined')
        }
        Text(){
          Span('test font ')
            .font({size:20,weight:400},{fontWeightConfigs:{
              enableVariableFontWeight:null,
              enableDeviceFontWeightCategory:null
            }})
            .id('testConfigsALLNull')
        }
        Text(){
          Span('test font ')
            .font({size:20,weight:400},{fontWeightConfigs:{
              enableVariableFontWeight:undefined,
              enableDeviceFontWeightCategory:undefined
            }})
            .id('testConfigsALLUndefined')
        }
        Text(){
          Span('test font ')
            .font({size:20,weight:600},{fontWeightConfigs:{
              enableVariableFontWeight:true,
              enableDeviceFontWeightCategory:true
            }})
            .id('testConfigsALLTrue')
        }
        Text(){
          Span('test font ')
            .font({size:20,weight:600},{fontWeightConfigs:{
              enableVariableFontWeight:false,
              enableDeviceFontWeightCategory:false
            }})
            .id('testConfigsALLFalse')
        }
      }.height('100%').width('100%').justifyContent(FlexAlign.Center)
    }
  }
}