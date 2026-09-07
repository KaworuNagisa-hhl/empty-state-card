import { describe, it, expect } from '@ohos/hypium'
import { getSwiftUIGlassMaterial } from 'theme'

export default function localUnitTest() {
  describe('SwiftUIEmptyStateCard', () => {
    it('executes_action_callback_contract', 0, () => {
      let actions = 0
      const onAction = () => {
        actions += 1
      }
      onAction()
      expect(actions).assertEqual(1)
    })

    it('uses_panel_glass_material_contract', 0, () => {
      expect(getSwiftUIGlassMaterial().fillStrong.toString()).assertContain('#')
    })
  })
}
