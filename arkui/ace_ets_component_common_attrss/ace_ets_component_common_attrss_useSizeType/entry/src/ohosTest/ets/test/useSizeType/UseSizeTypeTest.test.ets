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

import CommonTest from '../common/CommonTest';
import { describe, expect } from '@ohos/hypium'

class PageConfig {
  testName: string = '';
  pageName: string = '';
  pageUrl: string = '';
  parentHeight: number = 0;
  parentWidth: number = 0;
  gutter: number = 0;
  columns: number = 0;
}

class TestValues {
  describe: string = '';
  setValue?: setValue;
  expectValue?: UseSizeType;
}

class setValue {
  xs?: SpanOffset;
  sm?: SpanOffset;
  md?: SpanOffset;
  lg?: SpanOffset;
}

class UseSizeType {
  useSizeType?: setValue;
}

class SpanOffset {
  span: number = 0;
  offset: number = 0;
}

export default function useSizeTypeTest() {
  let supportView = [
    'AlphabetIndexer',
    'Button',
    'Blank',
    'Checkbox',
    'CheckboxGroup',
    'DataPanel',
    'DatePicker',
    'Divider',
    'Gauge',
    'Image',
    'ImageAnimator',
    'LoadingProgress',
    'Marquee',
    'Menu',
    'MenuItem',
    'MenuItemGroup',
    'Navigation',
    'NavRouter',
    'Progress',
    'QRCode',
    'Radio',
    'Rating',
    'ScrollBar',
    'Search',
    'Select',
    'Slider',
    'Stepper',
    'StepperItem',
    'TabContent',
    'Text',
    'TextArea',
    'TextClock',
    'TextInput',
    'TextPicker',
    'TextTimer',
    'TimePicker',
    'Toggle',
    'Badge',
    'Column',
    'ColumnSplit',
    'Counter',
    'Flex',
    'FlowItem',
    'GridCol',
    'GridRow',
    'Grid',
    'GridItem',
    'List',
    'ListItem',
    'ListItemGroup',
    'Navigator',
    'Panel',
    'Refresh',
    'RelativeContainer',
    'Row',
    'RowSplit',
    'Scroll',
    'SideBarContainer',
    'Stack',
    'Swiper',
    'Tabs',
    'Circle',
    'Ellipse',
    'Polyline',
    'Polygon',
    'Path',
    'Rect',
    'Shape',
    'Line',
    'WaterFlow'
  ]


  //Custom params.
  let parentWidth = 320;
  let parentHeight = 200;
  let gutter = 10;
  let columns = 3;
  let pageConfig: PageConfig = {
    testName: 'testUseSizeType',
    pageName: 'UseSizeTypePage',
    pageUrl: 'MainAbility/pages/useSizeType/UseSizeTypePage',
    parentHeight: parentHeight,
    parentWidth: parentWidth,
    gutter: gutter,
    columns: columns
  }

  let testValues: TestValues[] = [{
    describe: 'SetNumber',
    setValue: {
      xs: {
        span: 2, offset: 2
      },
      sm: {
        span: 2, offset: 2
      },
      md: {
        span: 2, offset: 2
      },
      lg: {
        span: 2, offset: 2
      }
    },
    expectValue: {
      useSizeType: {
        xs: {
          span: 2, offset: 2
        },
        sm: {
          span: 2, offset: 2
        },
        md: {
          span: 2, offset: 2
        },
        lg: {
          span: 2, offset: 2
        }
      },
    }
  }]

  describe('UseSizeTypeTest', () => {
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: ESObject) => {
      console.info('[' + data.caseTag + ']' + 'useSizeType.sx.span is:'
        + data.viewObj.$attrs.useSizeType.sx.span);
      expect(data.viewObj.$attrs.useSizeType.sx.span)
        .assertEqual(data.testValue.expectValue.useSizeType.xs.span);

      console.info('[' + data.caseTag + ']' + 'useSizeType.sx.offset is:'
        + data.viewObj.$attrs.useSizeType.sx.offset);
      expect(data.viewObj.$attrs.useSizeType.sx.offset)
        .assertEqual(data.testValue.expectValue.useSizeType.xs.offset);

      console.info('[' + data.caseTag + ']' + 'useSizeType.sm.span is:'
        + data.viewObj.$attrs.useSizeType.sm.span);
      expect(data.viewObj.$attrs.useSizeType.sm.span)
        .assertEqual(data.testValue.expectValue.useSizeType.sm.span);

      console.info('[' + data.caseTag + ']' + 'useSizeType.sm.offset is:'
        + data.viewObj.$attrs.useSizeType.sm.offset);
      expect(data.viewObj.$attrs.useSizeType.sm.offset)
        .assertEqual(data.testValue.expectValue.useSizeType.sm.offset);

      console.info('[' + data.caseTag + ']' + 'useSizeType.md.span is:'
        + data.viewObj.$attrs.useSizeType.md.span);
      expect(data.viewObj.$attrs.useSizeType.md.span)
        .assertEqual(data.testValue.expectValue.useSizeType.md.span);

      console.info('[' + data.caseTag + ']' + 'useSizeType.md.offset is:'
        + data.viewObj.$attrs.useSizeType.md.offset);
      expect(data.viewObj.$attrs.useSizeType.md.offset)
        .assertEqual(data.testValue.expectValue.useSizeType.md.offset);

      console.info('[' + data.caseTag + ']' + 'useSizeType.lg.span is:'
        + data.viewObj.$attrs.useSizeType.lg.span);
      expect(data.viewObj.$attrs.useSizeType.lg.span)
        .assertEqual(data.testValue.expectValue.useSizeType.lg.span);

      console.info('[' + data.caseTag + ']' + 'useSizeType.lg.offset is:'
        + data.viewObj.$attrs.useSizeType.lg.offset);
      expect(data.viewObj.$attrs.useSizeType.lg.offset)
        .assertEqual(data.testValue.expectValue.useSizeType.lg.offset);
    });
  })
}