import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_dogru_mu_uydurma_mi/oyun_dogru_mu_uydurma_mi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(dogruMuUydurmaMiConfig.title.length, 33);
    expect(dogruMuUydurmaMiConfig.tagline.length, 33);
    for (final s in dogruMuUydurmaMiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(dogruMuUydurmaMiConfig.gameId, dogruMuUydurmaMiId);
    expect(dogruMuUydurmaMiRules.gameId, dogruMuUydurmaMiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(dogruMuUydurmaMiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: dogruMuUydurmaMiId, optionalMechanics: dogruMuUydurmaMiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(dogruMuUydurmaMiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
