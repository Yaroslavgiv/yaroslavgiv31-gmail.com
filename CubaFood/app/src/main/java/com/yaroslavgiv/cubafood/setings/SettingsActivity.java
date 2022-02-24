package com.yaroslavgiv.cubafood.setings;
// основной экран настроек

import android.os.Bundle;
import android.view.MenuItem;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;

import com.yaroslavgiv.cubafood.R;

public class SettingsActivity extends AppCompatActivity {

    private ActionBar actionBar;

    @Override
    protected void onPostCreate(@Nullable Bundle savedInstanceState) {
        super.onPostCreate(savedInstanceState);
        if (getSupportActionBar() != null)
        {
            actionBar = getSupportActionBar();
            actionBar.setDisplayHomeAsUpEnabled(true);
            actionBar.setTitle(getString(R.string.action_settings));
        }
        getFragmentManager().beginTransaction().replace(android.R.id.content, new SettringsFragment()).commit();
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == android.R.id.home) // с помощью item ищем какой пункт меню настроек нажали
        {
            finish();
        }
        return true;
    }
}
