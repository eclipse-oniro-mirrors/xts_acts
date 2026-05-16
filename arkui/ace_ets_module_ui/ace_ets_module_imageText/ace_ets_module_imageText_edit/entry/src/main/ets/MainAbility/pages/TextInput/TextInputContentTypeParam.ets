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

@Entry
@Component
struct TextInputContentTypeParamTest {
  build() {
    Row() {
      Column() {
        // ========== ContentType property tests ==========

        // Row 1: default, null, undefined, USER_NAME, PASSWORD
        Row() {
          // Test ContentType default value (未设置 contentType 属性)
          TextInput({ placeholder: 'TextInput contentType default' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_default')

          // Test ContentType with null parameter
          TextInput({ placeholder: 'TextInput contentType null' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_null')
            .contentType(null)

          // Test ContentType with undefined parameter
          TextInput({ placeholder: 'TextInput contentType undefined' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_undefined')
            .contentType(undefined)

          // Test ContentType.USER_NAME (value: 0)
          TextInput({ placeholder: 'TextInput contentType USER_NAME' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_USER_NAME')
            .contentType(ContentType.USER_NAME)

          // Test ContentType.PASSWORD (value: 1)
          TextInput({ placeholder: 'TextInput contentType PASSWORD' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_PASSWORD')
            .contentType(ContentType.PASSWORD)
        }

        // Row 2: NEW_PASSWORD, FULL_STREET_ADDRESS, HOUSE_NUMBER, DISTRICT_ADDRESS, CITY_ADDRESS
        Row() {
          // Test ContentType.NEW_PASSWORD (value: 2)
          TextInput({ placeholder: 'TextInput contentType NEW_PASSWORD' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_NEW_PASSWORD')
            .contentType(ContentType.NEW_PASSWORD)

          // Test ContentType.FULL_STREET_ADDRESS (value: 3)
          TextInput({ placeholder: 'TextInput contentType FULL_STREET_ADDRESS' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_FULL_STREET_ADDRESS')
            .contentType(ContentType.FULL_STREET_ADDRESS)

          // Test ContentType.HOUSE_NUMBER (value: 4)
          TextInput({ placeholder: 'TextInput contentType HOUSE_NUMBER' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_HOUSE_NUMBER')
            .contentType(ContentType.HOUSE_NUMBER)

          // Test ContentType.DISTRICT_ADDRESS (value: 5)
          TextInput({ placeholder: 'TextInput contentType DISTRICT_ADDRESS' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_DISTRICT_ADDRESS')
            .contentType(ContentType.DISTRICT_ADDRESS)

          // Test ContentType.CITY_ADDRESS (value: 6)
          TextInput({ placeholder: 'TextInput contentType CITY_ADDRESS' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_CITY_ADDRESS')
            .contentType(ContentType.CITY_ADDRESS)
        }

        // Row 3: PROVINCE_ADDRESS, COUNTRY_ADDRESS, PERSON_FULL_NAME, PERSON_LAST_NAME, PERSON_FIRST_NAME
        Row() {
          // Test ContentType.PROVINCE_ADDRESS (value: 7)
          TextInput({ placeholder: 'TextInput contentType PROVINCE_ADDRESS' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_PROVINCE_ADDRESS')
            .contentType(ContentType.PROVINCE_ADDRESS)

          // Test ContentType.COUNTRY_ADDRESS (value: 8)
          TextInput({ placeholder: 'TextInput contentType COUNTRY_ADDRESS' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_COUNTRY_ADDRESS')
            .contentType(ContentType.COUNTRY_ADDRESS)

          // Test ContentType.PERSON_FULL_NAME (value: 9)
          TextInput({ placeholder: 'TextInput contentType PERSON_FULL_NAME' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_PERSON_FULL_NAME')
            .contentType(ContentType.PERSON_FULL_NAME)

          // Test ContentType.PERSON_LAST_NAME (value: 10)
          TextInput({ placeholder: 'TextInput contentType PERSON_LAST_NAME' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_PERSON_LAST_NAME')
            .contentType(ContentType.PERSON_LAST_NAME)

          // Test ContentType.PERSON_FIRST_NAME (value: 11)
          TextInput({ placeholder: 'TextInput contentType PERSON_FIRST_NAME' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_PERSON_FIRST_NAME')
            .contentType(ContentType.PERSON_FIRST_NAME)
        }

        // Row 4: PHONE_NUMBER, PHONE_COUNTRY_CODE, FULL_PHONE_NUMBER, EMAIL_ADDRESS, BANK_CARD_NUMBER
        Row() {
          // Test ContentType.PHONE_NUMBER (value: 12)
          TextInput({ placeholder: 'TextInput contentType PHONE_NUMBER' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_PHONE_NUMBER')
            .contentType(ContentType.PHONE_NUMBER)

          // Test ContentType.PHONE_COUNTRY_CODE (value: 13)
          TextInput({ placeholder: 'TextInput contentType PHONE_COUNTRY_CODE' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_PHONE_COUNTRY_CODE')
            .contentType(ContentType.PHONE_COUNTRY_CODE)

          // Test ContentType.FULL_PHONE_NUMBER (value: 14)
          TextInput({ placeholder: 'TextInput contentType FULL_PHONE_NUMBER' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_FULL_PHONE_NUMBER')
            .contentType(ContentType.FULL_PHONE_NUMBER)

          // Test ContentType.EMAIL_ADDRESS (value: 15)
          TextInput({ placeholder: 'TextInput contentType EMAIL_ADDRESS' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_EMAIL_ADDRESS')
            .contentType(ContentType.EMAIL_ADDRESS)

          // Test ContentType.BANK_CARD_NUMBER (value: 16)
          TextInput({ placeholder: 'TextInput contentType BANK_CARD_NUMBER' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_BANK_CARD_NUMBER')
            .contentType(ContentType.BANK_CARD_NUMBER)
        }

        // Row 5: ID_CARD_NUMBER, NICKNAME, DETAIL_INFO_WITHOUT_STREET, FORMAT_ADDRESS, PASSPORT_NUMBER
        Row() {
          // Test ContentType.ID_CARD_NUMBER (value: 17)
          TextInput({ placeholder: 'TextInput contentType ID_CARD_NUMBER' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_ID_CARD_NUMBER')
            .contentType(ContentType.ID_CARD_NUMBER)

          // Test ContentType.NICKNAME (value: 23)
          TextInput({ placeholder: 'TextInput contentType NICKNAME' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_NICKNAME')
            .contentType(ContentType.NICKNAME)

          // Test ContentType.DETAIL_INFO_WITHOUT_STREET (value: 24)
          TextInput({ placeholder: 'TextInput contentType DETAIL_INFO_WITHOUT_STREET' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_DETAIL_INFO_WITHOUT_STREET')
            .contentType(ContentType.DETAIL_INFO_WITHOUT_STREET)

          // Test ContentType.FORMAT_ADDRESS (value: 25)
          TextInput({ placeholder: 'TextInput contentType FORMAT_ADDRESS' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_FORMAT_ADDRESS')
            .contentType(ContentType.FORMAT_ADDRESS)

          // Test ContentType.PASSPORT_NUMBER (value: 26)
          TextInput({ placeholder: 'TextInput contentType PASSPORT_NUMBER' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_PASSPORT_NUMBER')
            .contentType(ContentType.PASSPORT_NUMBER)
        }

        // Row 6: VALIDITY, ISSUE_AT, ORGANIZATION, TAX_ID, ADDRESS_CITY_AND_STATE
        Row() {
          // Test ContentType.VALIDITY (value: 27)
          TextInput({ placeholder: 'TextInput contentType VALIDITY' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_VALIDITY')
            .contentType(ContentType.VALIDITY)

          // Test ContentType.ISSUE_AT (value: 28)
          TextInput({ placeholder: 'TextInput contentType ISSUE_AT' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_ISSUE_AT')
            .contentType(ContentType.ISSUE_AT)

          // Test ContentType.ORGANIZATION (value: 29)
          TextInput({ placeholder: 'TextInput contentType ORGANIZATION' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_ORGANIZATION')
            .contentType(ContentType.ORGANIZATION)

          // Test ContentType.TAX_ID (value: 30)
          TextInput({ placeholder: 'TextInput contentType TAX_ID' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_TAX_ID')
            .contentType(ContentType.TAX_ID)

          // Test ContentType.ADDRESS_CITY_AND_STATE (value: 31)
          TextInput({ placeholder: 'TextInput contentType ADDRESS_CITY_AND_STATE' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_ADDRESS_CITY_AND_STATE')
            .contentType(ContentType.ADDRESS_CITY_AND_STATE)
        }

        // Row 7: FLIGHT_NUMBER, LICENSE_NUMBER, LICENSE_FILE_NUMBER, LICENSE_PLATE, ENGINE_NUMBER
        Row() {
          // Test ContentType.FLIGHT_NUMBER (value: 32)
          TextInput({ placeholder: 'TextInput contentType FLIGHT_NUMBER' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_FLIGHT_NUMBER')
            .contentType(ContentType.FLIGHT_NUMBER)

          // Test ContentType.LICENSE_NUMBER (value: 33)
          TextInput({ placeholder: 'TextInput contentType LICENSE_NUMBER' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_LICENSE_NUMBER')
            .contentType(ContentType.LICENSE_NUMBER)

          // Test ContentType.LICENSE_FILE_NUMBER (value: 34)
          TextInput({ placeholder: 'TextInput contentType LICENSE_FILE_NUMBER' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_LICENSE_FILE_NUMBER')
            .contentType(ContentType.LICENSE_FILE_NUMBER)

          // Test ContentType.LICENSE_PLATE (value: 35)
          TextInput({ placeholder: 'TextInput contentType LICENSE_PLATE' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_LICENSE_PLATE')
            .contentType(ContentType.LICENSE_PLATE)

          // Test ContentType.ENGINE_NUMBER (value: 36)
          TextInput({ placeholder: 'TextInput contentType ENGINE_NUMBER' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_ENGINE_NUMBER')
            .contentType(ContentType.ENGINE_NUMBER)
        }

        // Row 8: LICENSE_CHASSIS_NUMBER
        Row() {
          // Test ContentType.LICENSE_CHASSIS_NUMBER (value: 37)
          TextInput({ placeholder: 'TextInput contentType LICENSE_CHASSIS_NUMBER' })
            .width('20%')
            .height('5%')
            .id('TextInput_contentType_LICENSE_CHASSIS_NUMBER')
            .contentType(ContentType.LICENSE_CHASSIS_NUMBER)
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}
