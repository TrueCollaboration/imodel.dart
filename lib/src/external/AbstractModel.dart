import 'package:ientity/library.dart';
import 'package:true_core/library.dart';

import 'interfaces/EModelState.dart';
import 'interfaces/IModel.dart';
import 'interfaces/IModelListeners.dart';
import 'interfaces/ModelController.dart';

abstract class AbstractModel<T extends IEntity> extends ModelController implements IModel {
  final T entity;
  
  @override
  IModelListeners get listeners;
  
  AbstractModel.fromEntity(this.entity);

  @override
  void initState() {
    super.initState();
    
    (listeners.state as Notifier<EModelState>).value = EModelState.initialized;
  }

  @override
  void dispose() {
    super.dispose();
    
    (listeners.state as Notifier<EModelState>).value = EModelState.disposed;
  }
}