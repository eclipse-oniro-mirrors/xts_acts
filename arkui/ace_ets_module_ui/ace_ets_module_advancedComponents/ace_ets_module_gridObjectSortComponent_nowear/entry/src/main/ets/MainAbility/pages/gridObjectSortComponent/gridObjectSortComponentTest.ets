/**
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

import { GridObjectSortComponent, GridObjectSortComponentItem, GridObjectSortComponentOptions, GridObjectSortComponentType } from '@ohos.arkui.advanced.GridObjectSortComponent';

@Entry
@Component
struct gridObjectSortComponentTest {
  @State dataList: GridObjectSortComponentItem[] = [
    {
      id: 0,
      url: $r('app.media.ic_controlcenter_location_filled'),
      text: '位置信息',
      selected: true,
      order: 3
    },
    {
      id: 1,
      url: $r('app.media.ic_controlcenter_mobiledata_filled'),
      text: '移动数据',
      selected: true,
      order: 9
    },
    {
      id: 2,
      url: $r('app.media.ic_controlcenter_nfc_filled'),
      text: 'NFC',
      selected: false,
      order: 1
    },
    {
      id: 3,
      url: $r('app.media.ic_controlcenter_ring_off_filled'),
      text: '响铃关闭',
      selected: true,
      order: 4
    },
    {
      id: 4,
      url: $r('app.media.ic_controlcenter_ring_on_filled'),
      text: '响铃',
      selected: false,
      order: 5
    },
    {
      id: 5,
      url: $r('app.media.ic_controlcenter_ultra_power_saver_filled'),
      text: '低电量模式',
      selected: true,
      order: 6
    },
    {
      id: 6,
      url: $r('app.media.ic_controlcenter_screenshot_filled'),
      text: '截屏',
      selected: true,
      order: 7
    },
    {
      id: 7,
      url: $r('app.media.ic_controlcenter_screen_recording_filled'),
      text: '屏幕录制',
      selected: true,
      order: 8
    },
    {
      id: 8,
      url: $r('app.media.ic_controlcenter_super_power_saver_filled'),
      text: '超级省电',
      selected: false,
      order: 9
    },
  ]

  @State option: GridObjectSortComponentOptions = {
    type: GridObjectSortComponentType.IMAGE_TEXT,
    imageSize: 45,
    normalTitle: '菜单',
    editTitle: '编辑',
    showAreaTitle: '长按拖动排序',
    addAreaTitle: '点击添加'
  }

  build() {
    Column() {
      GridObjectSortComponent({
        options: this.option,
        dataList: this.dataList,
        onSave: (
          select: Array<GridObjectSortComponentItem>,
          unselect: Array<GridObjectSortComponentItem>
        ) => {
          // save ToDo
        },
        onCancel: () =>{
          // cancel ToDo
        }
      })
    }
    .height('90%')
    .margin({top: '2%', left: '2%', right: '2%'})
  }
}