/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { typeNode, NodeController, FrameNode } from  '@ohos.arkui.node';
let data1: BadgeParamWithString = {
  value: '1',
  style: {
    fontSize: $r('app.string.fontSize_10')
  },
  position: undefined
}

let data2: BadgeParamWithString = {
  value: '2',
  style: {
    fontWeight: $r('app.string.fontWeight_normal'),
  },
  position: undefined
}

let data3: BadgeParamWithString = {
  value: $r('app.string.text_string'),
  style: {},
  position: undefined
}

let data4: BadgeParamWithString = {
  value: '4',
  style: {
    badgeSize: $r('app.string.size_30'),
  },
  position: undefined
}

let data5: BadgeParamWithString = {
  value: '5',
  style: {
    fontSize: $r('app.media.icon')
  },
  position: undefined
}

let data6: BadgeParamWithString = {
  value: '6',
  style: {
    fontWeight: $r('app.media.icon'),
  },
  position: undefined
}

let data7: BadgeParamWithString = {
  value: $r('app.media.icon'),
  style: {
    fontWeight: FontWeight.Normal,

  },
  position: undefined
}

let data8: BadgeParamWithString = {
  value: '8',
  style: {
    badgeSize: $r('app.media.icon'),

  },
  position: undefined
}

class MyNodeController extends  NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext)
    let col = typeNode.createNode(uiContext, 'Column')
    let row = typeNode.createNode(uiContext, 'Row')
    col.initialize().borderColor(Color.Black).alignItems(HorizontalAlign.Center).width('50%')
    row.initialize()

    let badgeString1 = typeNode.createNode(uiContext, 'Badge')
    badgeString1.initialize(data1).key('key_resource_badge_001')
    let imageString1 = typeNode.createNode(uiContext, 'Image')
    imageString1.initialize($r('app.media.icon')).width('30%')
    badgeString1.appendChild(imageString1)
    col.appendChild(badgeString1)

    let badgeString2 = typeNode.createNode(uiContext, 'Badge')
    badgeString2.initialize(data2).key('key_resource_badge_002')
    let imageString2 = typeNode.createNode(uiContext, 'Image')
    imageString2.initialize($r('app.media.icon')).width('30%')
    badgeString2.appendChild(imageString2)
    col.appendChild(badgeString2)

    let badgeString3 = typeNode.createNode(uiContext, 'Badge')
    badgeString3.initialize(data3).key('key_resource_badge_003')
    let imageString3 = typeNode.createNode(uiContext, 'Image')
    imageString3.initialize($r('app.media.icon')).width('30%')
    badgeString3.appendChild(imageString3)
    col.appendChild(badgeString3)

    let badgeString4 = typeNode.createNode(uiContext, 'Badge')
    badgeString4.initialize(data4).key('key_resource_badge_004')
    let imageString4 = typeNode.createNode(uiContext, 'Image')
    imageString4.initialize($r('app.media.icon')).width('30%')
    badgeString4.appendChild(imageString4)
    col.appendChild(badgeString4)

    let badgeString5 = typeNode.createNode(uiContext, 'Badge')
    badgeString5.initialize(data5).key('key_resource_badge_005')
    let imageString5 = typeNode.createNode(uiContext, 'Image')
    imageString5.initialize($r('app.media.icon')).width('30%')
    badgeString5.appendChild(imageString5)
    col.appendChild(badgeString5)

    let badgeString6 = typeNode.createNode(uiContext, 'Badge')
    badgeString6.initialize(data6).key('key_resource_badge_006')
    let imageString6 = typeNode.createNode(uiContext, 'Image')
    imageString6.initialize($r('app.media.icon')).width('30%')
    badgeString6.appendChild(imageString6)
    col.appendChild(badgeString6)

    let badgeString7 = typeNode.createNode(uiContext, 'Badge')
    badgeString7.initialize(data7).key('key_resource_badge_007')
    let imageString7 = typeNode.createNode(uiContext, 'Image')
    imageString7.initialize($r('app.media.icon')).width('30%')
    badgeString7.appendChild(imageString7)
    col.appendChild(badgeString7)

    let badgeString8 = typeNode.createNode(uiContext, 'Badge')
    badgeString8.initialize(data8).key('key_resource_badge_008')
    let imageString8 = typeNode.createNode(uiContext, 'Image')
    imageString8.initialize($r('app.media.icon')).width('30%')
    badgeString8.appendChild(imageString8)
    col.appendChild(badgeString8)

    node.appendChild(col)
    node.appendChild(row)
    return node
  }
}
@Entry
@Component
struct badge {
  private myNodeController: MyNodeController = new MyNodeController();
  build() {
    Column() {
      Row(){
        NodeContainer(this.myNodeController)
        Column(){
          Badge(data1){
            Image($r('app.media.icon'))
              .width('30%')
          }.key('key_resource_badge_011')
          Badge(data2){
            Image($r('app.media.icon'))
              .width('30%')
          }.key('key_resource_badge_012')
          Badge(data3){
            Image($r('app.media.icon'))
              .width('30%')
          }.key('key_resource_badge_013')
          Badge(data4){
            Image($r('app.media.icon'))
              .width('30%')
          }.key('key_resource_badge_014')
          Badge(data5){
            Image($r('app.media.icon'))
              .width('30%')
          }.key('key_resource_badge_015')
          Badge(data6){
            Image($r('app.media.icon'))
              .width('30%')
          }.key('key_resource_badge_016')
          Badge(data7){
            Image($r('app.media.icon'))
              .width('30%')
          }.key('key_resource_badge_017')
          Badge(data8){
            Image($r('app.media.icon'))
              .width('30%')
          }.key('key_resource_badge_018')
        }.width('50%')

      }
    }
  }
}