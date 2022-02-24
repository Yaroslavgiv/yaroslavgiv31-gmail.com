package com.yaroslavgiv.cubafood;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

import androidx.core.view.GravityCompat;
import androidx.appcompat.app.ActionBarDrawerToggle;

import android.view.MenuItem;

import com.google.android.material.navigation.NavigationView;
import com.yaroslavgiv.cubafood.setings.SettingsActivity;

import androidx.drawerlayout.widget.DrawerLayout;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import android.view.Menu;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Arrays;

public class MainActivity extends AppCompatActivity implements NavigationView.OnNavigationItemSelectedListener {
    private String[] array;
    private ArrayAdapter < String > adapter;
    private Toolbar toolbar;
    private DrawerLayout drawer;
    private int category_index;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        ListView list = findViewById(R.id.listVwe);
        array = getResources().getStringArray(R.array.burger_array);
        adapter = new ArrayAdapter <>(this, android.R.layout.simple_list_item_1, new ArrayList <>(Arrays.asList(array)));
        list.setAdapter(adapter);
        toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);


        drawer = findViewById(R.id.drawer_layout);
        NavigationView navigationView = findViewById(R.id.nav_view);
        navigationView.setNavigationItemSelectedListener(this);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawer.addDrawerListener(toggle);
        toggle.syncState();

        list.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView < ? > parent, View view, int position, long id)
            {
Intent intent = new Intent(MainActivity.this,Text_Content_Activiti.class);
intent.putExtra("category", category_index);
intent.putExtra("position", position);
startActivity(intent);
            }
        });


    }

    @Override
    public void onBackPressed() {
        DrawerLayout drawer = findViewById(R.id.drawer_layout);
        if (drawer.isDrawerOpen(GravityCompat.START)) {
            drawer.closeDrawer(GravityCompat.START);
        } else {
            super.onBackPressed();
        }

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
// Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        toolbar.setTitle(R.string.burger);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
// Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

//noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {

            Intent i = new Intent(MainActivity.this, SettingsActivity.class);
            startActivity(i);
        }

        return super.onOptionsItemSelected(item);
    }

    @Override
    public boolean onNavigationItemSelected(MenuItem item) {
// Handle navigation view item clicks here.
        int id = item.getItemId();

        if (id == R.id.id_burger) {
            Toast.makeText(this, "Бомба Бургер", Toast.LENGTH_SHORT).show();
            toolbar.setTitle(R.string.burger);
            array = getResources().getStringArray(R.array.burger_array);
            adapter.clear();
            adapter.addAll(array);
            adapter.notifyDataSetChanged();
            category_index = 0;

        } else if
        (id == R.id.id_sandwich) {
            Toast.makeText(this, "КУБА Сэндвич", Toast.LENGTH_SHORT).show();
            toolbar.setTitle(R.string.sandwich);
            array = getResources().getStringArray(R.array.sandwich_array);
            adapter.clear();
            adapter.addAll(array);
            adapter.notifyDataSetChanged();
            category_index = 1;

        } else if (id == R.id.id_grill) {
            Toast.makeText(this, "ГОРЯЧО ААА", Toast.LENGTH_SHORT).show();
            toolbar.setTitle(R.string.grill);
            array = getResources().getStringArray(R.array.grill_array);
            adapter.clear();
            adapter.addAll(array);
            adapter.notifyDataSetChanged();
            category_index = 2;

        } else if (id == R.id.id_tandoor) {
            Toast.makeText(this, "Жарко как в Баньке", Toast.LENGTH_SHORT).show();
            toolbar.setTitle(R.string.tandoor);
            array = getResources().getStringArray(R.array.tandoor_array);
            adapter.clear();
            adapter.addAll(array);
            adapter.notifyDataSetChanged();
            category_index = 3;

        } else if (id == R.id.id_ingredients) {
            Toast.makeText(this, "Всё необходимое здесь", Toast.LENGTH_SHORT).show();
            toolbar.setTitle(R.string.ingredients);
            array = getResources().getStringArray(R.array.ingredients_array);
            adapter.clear();
            adapter.addAll(array);
            adapter.notifyDataSetChanged();
            category_index = 4;

        } else if (id == R.id.id_sovet) {
            Toast.makeText(this, "Чутка перчика", Toast.LENGTH_SHORT).show();
            toolbar.setTitle(R.string.sovet);
            array = getResources().getStringArray(R.array.sovet_array);
            adapter.clear();
            adapter.addAll(array);
            adapter.notifyDataSetChanged();
            category_index = 5;
        }

        DrawerLayout drawer = findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }

    private void fillArray(int title, int arrayList, int index) {
        toolbar.setTitle(title);
        array = getResources().getStringArray(arrayList);
        adapter.clear();
        adapter.addAll(array);
        adapter.notifyDataSetChanged();
    }
}