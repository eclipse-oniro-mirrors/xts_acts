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

import Log from '../../common/Log';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct SearchOnCut {
  controller: SearchController = new SearchController()

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear SearchOnCut start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear SearchOnCut end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text('search-OnCut')
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key('onCutTextSearchText')

      Search({ value: '', placeholder: 'search-OnCut', controller: this.controller })
        .searchButton('Search')
        .textFont({ size: 20 })
        .placeholderFont({ size: 20 })
        .onCut((value: string) => {
          console.log('onCut: ' + value)
        })
        .key('OnCutSearch')

      Text('search-OnPaste')
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key('onPasteTextSearchText')

      Search({ value: '', placeholder: 'search-OnPaste', controller: this.controller })
        .searchButton('Search')
        .textFont({ size: 20 })
        .placeholderFont({ size: 20 })
        .onPaste((value: string) => {
          console.log('onPaste: ' + value)
        })
        .key('OnPasteSearch')

      Text('search-CopyOption')
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key('copyOptionTextSearchText')

      Search({ value: '', placeholder: 'search-CopyOption', controller: this.controller })
        .searchButton('Search')
        .textFont({ size: 20 })
        .placeholderFont({ size: 20 })
        .key('CopyOptionSearch')

    }.width('100%').height('100%')
  }
}
