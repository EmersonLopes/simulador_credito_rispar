// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simulation_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SimulationController on SimulationControllerBase, Store {
  late final _$stateSimulationAtom =
      Atom(name: 'SimulationControllerBase.stateSimulation', context: context);

  @override
  StateController get stateSimulation {
    _$stateSimulationAtom.reportRead();
    return super.stateSimulation;
  }

  @override
  set stateSimulation(StateController value) {
    _$stateSimulationAtom.reportWrite(value, super.stateSimulation, () {
      super.stateSimulation = value;
    });
  }

  late final _$saveSimulationAsyncAction =
      AsyncAction('SimulationControllerBase.saveSimulation', context: context);

  @override
  Future<dynamic> saveSimulation() {
    return _$saveSimulationAsyncAction.run(() => super.saveSimulation());
  }

  @override
  String toString() {
    return '''
stateSimulation: ${stateSimulation}
    ''';
  }
}
